package com.book.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.domain.AutoVO;
import com.book.domain.BookInfoVO;
import com.book.domain.GenreVO;
import com.book.domain.PriceVO;
import com.book.service.BookService;
import com.book.util.CrawlUtil;
import com.book.util.NaverSearch;
import com.mysql.cj.xdevapi.JsonParser;

@Controller("BookController")
public class BookController {
	
	@Inject
	private BookService bservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//도서 메인 페이지
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView bookHome(Locale locale) {
		logger.info("Welcome book mainpage! The client locale is {}.", locale);
		
		ModelAndView mav = new ModelAndView();
		Date date = new Date();
		
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		//mav.addObject("serverTime", formattedDate);
		
		mav.setViewName("bookmain");
		return mav;
		
	}
	
	//도서 검색 페이지
	@RequestMapping(value="search", method=RequestMethod.GET)
	public ModelAndView bookSearch() {
		ModelAndView mav = new ModelAndView();
		logger.info("Welcome search! The client url is {}.", "/book/search");
		
		mav.setViewName("booksearch");
		return mav;
	}
	// 도서 검색 페이지 / default text
	@RequestMapping(value="search/{text}", method=RequestMethod.GET)
	public ModelAndView bookSearch(@PathVariable("text") String text) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("text", text);
		mav.setViewName("booksearch");
		
		return mav;
	}
	// 도서 검색 결과 return
	@ResponseBody
	@RequestMapping(value="search/{text}/{num}", method=RequestMethod.GET, produces = "application/json; charset=utf-8")
	public StringBuffer bookSearch(@PathVariable("text") String text, @PathVariable("num") int start) {
		return bservice.bookSearch(text, start);
	}  
	// 도서 검색 자동완성 결과 return
	@ResponseBody
	@RequestMapping(value="search/autocomplete", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public List<AutoVO> autoComplete(@RequestBody String query) {
		System.out.println(query);
		return bservice.autocomplete(query);
	}
	
	//도서 베스트셀러 페이지
	@RequestMapping(value="bestseller", method=RequestMethod.GET)
	public String bookSeller(Model model, HttpServletRequest req) {
		logger.info("Welcome search! The client url is {}.", "/book/bestseller");
		HttpSession session = req.getSession();
		String usercode =  Integer.toString((int) (session.getAttribute("usercode")==null?0:session.getAttribute("usercode")));
		
		// default
		model.addAttribute("slist",bservice.selectStore());
		model.addAttribute("s_site", "YES24");
		model.addAttribute("genre", "종합");
		model.addAttribute("glist", bservice.selectGenre("YES24"));
		Map<String, String> cate = bservice.getCate("YES24", "종합");
		model.addAttribute("bests", bservice.findBests(cate.get("bscate"), cate.get("sgcategory"), usercode));
		
		return "bookbests";
	}
	//도서 베스트셀러 인터넷 서점 장르목록 가져오기
	@ResponseBody
	@RequestMapping(value="bestseller/{s_site}", method=RequestMethod.POST)
	public List<GenreVO> bookSeller(@PathVariable("s_site") String site, Model model) {
		List<GenreVO> gVO = bservice.selectGenre(site);
		model.addAttribute("s_site", site);
		model.addAttribute("glist", gVO);
		return gVO;
	}
	//도서 베스트셀러 결과 (각 서점, 장르별)
	@RequestMapping(value= "bestseller/{s_site}/{genre}", method=RequestMethod.GET)
	public String bookSeller(@PathVariable("s_site") String site , @PathVariable("genre") String genre, Model model, HttpServletRequest req) {
		System.out.printf("사이트 : %s, 장르 : %s \n", site, genre);
		HttpSession session = req.getSession();
		String usercode =  Integer.toString((int) (session.getAttribute("usercode")==null?0:session.getAttribute("usercode")));
		
		genre = genre.replaceAll("-", "/");
		model.addAttribute("s_site", site);
		model.addAttribute("genre", genre);
		model.addAttribute("slist", bservice.selectStore());
		model.addAttribute("glist", bservice.selectGenre(site));
		
		Map<String, String> cate = bservice.getCate(site, genre);
		System.out.println(cate.get("bscate")+","+cate.get("sgcategory"));
		model.addAttribute("bests", bservice.findBests(cate.get("bscate"), cate.get("sgcategory"), usercode));
		
		return "bookbests";
	}
	
	// 도서 서점 위치 지도
	@RequestMapping(value="store", method=RequestMethod.GET)
	public ModelAndView bookShop() {
		ModelAndView mav = new ModelAndView();
		logger.info("Welcome store! The client url is {}.", "/book/shop");
	
		mav.setViewName("bookshop");
		return mav;
	}
	
	// 도서 정보
	@RequestMapping(value="info/{isbn}", method=RequestMethod.GET)
	public ModelAndView bookInfo(@PathVariable("isbn") String isbn, HttpServletRequest req) throws Exception {
		logger.info("Welcome info! The client url is {}.", "/book/info");
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		
		int user = (int) (session.getAttribute("usercode")==null?0:session.getAttribute("usercode"));
		String usercode =  Integer.toString(user);
		
		String result = NaverSearch.booksearch(isbn).toString();
		
		
		mav.addObject("info", JsonParser.parseDoc(result));
		mav.addObject("pointed", bservice.checkPoint(usercode, isbn));
		
		mav.setViewName("bookinfo");
		return mav;
	}
	
	// 도서 상세 정보
	@ResponseBody
	@RequestMapping(value="info/bookdesc", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String bookDesc(@RequestBody BookInfoVO biVo) throws Exception {
		String link = biVo.getLink();
		System.out.println(link);
		return CrawlUtil.bookInfo(link).toString();
	}
	// 도서 가격 정보
	@ResponseBody
	@RequestMapping(value="info/bookprice", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, PriceVO> bookPrice(@RequestBody BookInfoVO biVo) throws Exception {
		System.out.println(biVo.getIsbn());
		return CrawlUtil.getPrices(biVo.getIsbn());
	}
	// 도서 평점 정보
	@ResponseBody
	@RequestMapping(value="info/bookpoint", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String bookPoint(@RequestBody BookInfoVO biVo) throws Exception {
		String link = biVo.getLink();
		return CrawlUtil.getPoint(link).toString().split(":")[1].split("%")[0];
	}
	
	// 도서 찜하기
	@ResponseBody
	@RequestMapping(value="pointbook", method=RequestMethod.POST)
	public void pointBook(@RequestBody BookInfoVO biVo, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		int usercode = (int) session.getAttribute("usercode");
		System.out.println(biVo.toString());
		Map<String, Object> map = new HashMap<String, Object>();

		bservice.insertBook(biVo);
		map.put("usercode", usercode);
		map.put("isbn", biVo.getIsbn());
		bservice.pointBook(map);
	}
	// 찜 확인
	@ResponseBody
	@RequestMapping(value="pointcheck", method=RequestMethod.POST)
	public int checkPoint(@RequestBody BookInfoVO biVo, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String usercode = Integer.toString((int) session.getAttribute("usercode"));
	
		return bservice.checkPoint(usercode, biVo.getIsbn());
	}
	//찜목록
	@RequestMapping(value="bookmark", method=RequestMethod.GET)
	public ModelAndView bookmark(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		String usercode = Integer.toString((int) session.getAttribute("usercode"));
		mav.addObject("bookmark", bservice.bookmark(usercode));
		
		mav.setViewName("bookmark");
		return mav;
	}
	
	
	
}
