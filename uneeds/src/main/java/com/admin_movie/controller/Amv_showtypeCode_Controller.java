package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.ShowtypeVO;
import com.movie.service.ShowtypeService;

@Controller
public class Amv_showtypeCode_Controller {
	
	@Inject
	private ShowtypeService stservice;
	
	//상영형태리스트-ajax
	@RequestMapping(value="list_Showtype", method=RequestMethod.GET)
	public @ResponseBody List<ShowtypeVO> list_Showtype() throws Exception{
		return stservice.listall_showtype();
	}
	
	//상영형태등록-ajax
	@RequestMapping(value="insert_Showtype", method=RequestMethod.POST)
	public String insert_Showtype(ShowtypeVO stvo) throws Exception{
		stservice.insert_showtype(stvo);
		return "redirect:main";
	}
	
	//상영형태삭제-ajax
	@RequestMapping(value="delete_Showtype", method=RequestMethod.POST)
	public String delete_Showtype(ShowtypeVO stvo) throws Exception{
		stservice.delete_showtype(stvo);
		return "redirect:main";
	}
}
