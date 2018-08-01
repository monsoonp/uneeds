package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.RtimeVO;
import com.movie.service.RtimeService;

@Controller
public class Amv_rtimeCode_Controller {
	
	@Inject
	private RtimeService rtservice;
	
	//상영시간리스트-ajax
	@RequestMapping(value="list_Rtime", method=RequestMethod.GET)
	public @ResponseBody List<RtimeVO> list_Rtime() throws Exception{
		return rtservice.listall_rtime();
	}
	
	//상영시간등록-ajax
	@RequestMapping(value="insert_Rtime", method=RequestMethod.POST)
	public String insert_Rtime(RtimeVO rvo) throws Exception{
		rtservice.insert_rtime(rvo);
		return "redirect:main";
	}
	
	//상영시간삭제-ajax
	@RequestMapping(value="delete_Rtime", method=RequestMethod.POST)
	public String delete_Rtime(RtimeVO rvo) throws Exception{
		rtservice.delete_rtime(rvo);
		return "redirect:main";
	}
}
