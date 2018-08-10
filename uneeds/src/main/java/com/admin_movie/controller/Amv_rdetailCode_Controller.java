package com.admin_movie.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.RdetailVO;
import com.movie.service.RdetailService;


@Controller
public class Amv_rdetailCode_Controller {
	
	@Inject
	private RdetailService rdservice;
	
	//시간표코드 카운팅
	@RequestMapping(value="timetcd_count", method=RequestMethod.POST)
	public @ResponseBody int timetcd_count(RdetailVO rdvo) throws Exception{
		int x = rdservice.timetcd_count(rdvo);
		return x;
	}
	
}
