package com.food.controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.food.domain.Food_dataVo;
import com.food.domain.Food_searchPageMaker;
import com.food.domain.Food_searchVo;
import com.food.mongos.MongoUtil;
import com.food.persistence.Food_MydataDAO;
import com.food.service.Food_MongodataService;
import com.food.service.Food_MydataService;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoIterable;

@Controller
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Inject
	Food_MongodataService fds;
	
	@Inject
	Food_MydataDAO dao;
	
	@Inject
	private Food_MydataService fs;
	
	@RequestMapping(value="main", method=RequestMethod.POST)
	public String main_post(HttpServletRequest r, RedirectAttributes ra) {
		try {
			r.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String searchs = r.getParameter("main_search");
		ra.addAttribute("searchs", searchs);
		int kid = 0;
		ra.addAttribute("kid",kid);
		return "redirect:search";
	}
	
	// 메인페이지 로딩
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/main");		
		return "main";
	}
	
	// 검색 페이지 로딩
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(Food_searchVo svo, @RequestParam("searchs") String searchs, @RequestParam("kid") int kid, Model m) throws Exception {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/search");
		svo.setKeyword(searchs);
		svo.setKid(kid);
		if(kid == 0) {
			m.addAttribute("search_list", dao.searchFood(svo));
		}else {
				m.addAttribute("search_list", dao.searchFood_kind(svo));				
		}
		Food_searchPageMaker pageMaker = new Food_searchPageMaker();
		pageMaker.setSvo(svo);
		pageMaker.setTotalCount(fs.countpage_kid(svo));
		m.addAttribute("pageMaker", pageMaker);
		return "search";
	}
	
	@RequestMapping(value="search", method=RequestMethod.POST)
	public String searchs(HttpServletRequest r, RedirectAttributes ra) {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/searchs");
		try {
			r.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String search = r.getParameter("search");
		String kids = r.getParameter("kid");
		int kid = Integer.parseInt(kids);
		ra.addAttribute("searchs", search);
		ra.addAttribute("kid", kid);
		return "redirect:search";
	}
	
	// 상세보기 로딩
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(@RequestParam("fid") int fid, Model m) {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/detail");
		m.addAttribute("list", dao.detail(fid));
		return "detail";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.POST)
	public String detail_like(HttpServletRequest r) {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/detail");
		String fids = r.getParameter("fid");
		int fid = Integer.parseInt(fids);
		dao.detail_like(fid);
		return "detail";
	}
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public String reservation(@RequestParam("fid") int fid, Model m) {
		logger.info("Welcome search! The client url is {}.", "/uneeds/food/detail");
		m.addAttribute("list", dao.detail(fid));
		return "reservation";
	}
		
	/* MongodbConnection list*/
	@RequestMapping("/mongoutil_test")
	public String testMongoutil(Model m) {
		// list_collection 을 MongoUtil로 구현
		// collection list
		MongoIterable<String> cols = MongoUtil.getDb("food_database").listCollectionNames();
		// Iterable을 list로 변환
		List<String> list = StreamSupport.stream(cols.spliterator(), false).collect(Collectors.toList());
		// setAttribute
		m.addAttribute("list", list);
		return "mongo_list";
	}
	
	@RequestMapping(value = "mongo_list_ajax", method = RequestMethod.GET)
	public @ResponseBody List<Document> mongo_list(HttpServletRequest r) {
		// return
		try {
			String cn = r.getParameter("col_name");
			return fds.listAll(cn);
		} catch (Exception e) {
			logger.error("예외! : " + e.getMessage());
		}
		//
		return new ArrayList<>();
	}
	
	@RequestMapping(value = "food_insert", method = RequestMethod.POST)
	public String insertMember(HttpServletRequest r) {
		try {
			r.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Kid String -> int 변환
		// 초기
		String kids = r.getParameter("kid");
		int kid = Integer.parseInt(kids);
		String lids = r.getParameter("lid");
		int lid = Integer.parseInt(lids);
		
		Food_dataVo vo = new Food_dataVo();
		vo.setLid(lid);
		vo.setFname(r.getParameter("fname"));
		vo.setFgmenu(r.getParameter("fgmenu"));
		vo.setFdetail(r.getParameter("fdetail"));
		vo.setFaddr(r.getParameter("faddr"));
		vo.setFphone(r.getParameter("fphone"));
		vo.setKid(kid);
		vo.setFimg1(r.getParameter("fimg1"));
		vo.setFimg2(r.getParameter("fimg2"));
		vo.setFimg3(r.getParameter("fimg3"));	
		
		// insert
		dao.insertData(vo);

		return "redirect:food_list";
	}
	
	@RequestMapping(value = "food_list", method = RequestMethod.GET)
	public String listMember(Model m) {
		m.addAttribute("list", dao.selectFood());
		return "food_list";
	}	


}
