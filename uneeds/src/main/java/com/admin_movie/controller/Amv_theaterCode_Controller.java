package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.TheaterVO;
import com.movie.service.TheaterService;

@Controller
public class Amv_theaterCode_Controller {
	
	@Inject
	private TheaterService tservice;
	
	//영화관지점리스트-ajax
	@RequestMapping(value="list_Theater", method=RequestMethod.GET)
	public @ResponseBody List<TheaterVO> list_Showtype() throws Exception{
		return tservice.listall_Theater();
	}
	
	//영화관지점등록-ajax
	@RequestMapping(value="insert_Theater", method=RequestMethod.POST)
	public String insert_Showtype(TheaterVO tvo) throws Exception{
		tservice.insert_Theater(tvo);
		return "redirect:main";
	}
	
	//영화관지점삭제-ajax
	@RequestMapping(value="delete_Theater", method=RequestMethod.POST)
	public String delete_Showtype(TheaterVO tvo) throws Exception{
		tservice.delete_Theater(tvo);
		return "redirect:main";
	}
}
