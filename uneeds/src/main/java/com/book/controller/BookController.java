package com.book.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.domain.GenreVO;
import com.book.service.BookService;

@Controller("BookController")
//@RequestMapping(value="/book")
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
		
		mav.addObject("serverTime", formattedDate);
		mav.addObject("time", bservice.getTime());
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
	@RequestMapping(value="search/{text}", method=RequestMethod.GET)
	public ModelAndView bookSearch(@PathVariable("text") String text) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("text", text);
		mav.setViewName("booksearch");
		System.out.println(text);
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/search/{text}/{num}", method=RequestMethod.GET, produces = "application/json; charset=utf8")
	public StringBuffer bookSearch(@PathVariable("text") String text, @PathVariable("num") int start) {
		
		return bservice.bookSearch(text, start);
	}   
	
	//도서 베스트셀러 페이지
	@RequestMapping(value="bestseller", method=RequestMethod.GET)
	public String bookSeller(Model model) {
		logger.info("Welcome search! The client url is {}.", "/book/bestseller");
		model.addAttribute("slist",bservice.selectStore());
		return "bookbests";
	}
	//도서 베스트셀러 인터넷 서점 장르목록 가져오기
	@ResponseBody
	@RequestMapping(value="bestseller/{site}", method=RequestMethod.GET)
	public List<GenreVO> bookSeller(@PathVariable("site") String site, Model model) {
		List<GenreVO> gVO = bservice.selectGenre(site);
		model.addAttribute("site", site);
		model.addAttribute("glist", gVO);
		return gVO;
	}
	//도서 베스트셀러 결과 (각 서점, 장르별)
	@RequestMapping(value= "bestseller/{site}/{genre}", method=RequestMethod.GET)
	public String bookSeller(@PathVariable("site") String site , @PathVariable("genre") String genre, Model model) {
		System.out.printf("사이트 : %s, 장르 : %s \n", site, genre);
		genre = genre.replaceAll("-", "/");
		model.addAttribute("site", site);
		model.addAttribute("genre", genre);
		model.addAttribute("slist", bservice.selectStore());
		model.addAttribute("glist", bservice.selectGenre(site));
		
		Map<String, String> cate = bservice.getCate(site, genre);
		System.out.println(cate.get("bscate")+","+cate.get("sgcategory"));
		model.addAttribute("bests", bservice.findBests(cate.get("bscate"), cate.get("sgcategory")));
		return "bookbests";
	}
	
	// 도서 서점 위치 지도
	@RequestMapping(value="store", method=RequestMethod.GET)
	public ModelAndView bookShop() {
		ModelAndView mav = new ModelAndView();
		logger.info("Welcome shop! The client url is {}.", "/book/shop");
	
		mav.setViewName("bookshop");
		return mav;
	}
	
	// 도서 상세 페이지
	@RequestMapping(value="info", method=RequestMethod.GET)
	public ModelAndView bookInfo() {
		ModelAndView mav = new ModelAndView();
		logger.info("Welcome shop! The client url is {}.", "/book/info");
	
		mav.setViewName("bookinfo");
		return mav;
	}
	
	
}
