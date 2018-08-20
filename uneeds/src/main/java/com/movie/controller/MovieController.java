package com.movie.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.lf5.viewer.configure.MRUFileManager;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.domain.ViewRmovieVO;
import com.movie.domain.ViewTotalreservVO;
import com.movie.service.VRmovieService;

@Controller
public class MovieController {
	// http://localhost:8080/uneeds/movie/*
	
	//http://localhost:8080/uneeds/movie/main
	//영화메인
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(){
		return "main";
	}
	
	//예약메인
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(){
		return "reservation";
	}
//
//	@RequestMapping(value = "/reserv_seat", method = RequestMethod.GET)
//	public String reserv_seat(){
//		//System.out.println(req.getParameter("imgpath"));
//		return "reservation2";
//	}

	//할인결제
	@RequestMapping(value = "/reserv_paym", method = RequestMethod.GET)
	public String reserv_paym(){
		
		return "reservation3";
	}
	
	//예매내역
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(){
		return "orderlist";
	}
	
	//박스오피스
	@RequestMapping(value = "/boxoffice", method = RequestMethod.GET)
	public String boxoffice(){
		return "boxoffice";
	}

	//데이터랩
	@RequestMapping(value = "/datalab", method = RequestMethod.GET)
	public String datalab(){
		return "datalab";
	}	
}
