package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.WatchgradeVO;
import com.movie.service.WatchgradeService;

@Controller
public class Amv_watchgradeCode_Controller {
	
	@Inject
	private WatchgradeService wgservice;

	//관람등급리스트-ajax
	@RequestMapping(value="list_wgrade", method=RequestMethod.GET)
	public @ResponseBody List<WatchgradeVO> list_wgrade() throws Exception{
		return wgservice.listall_wgrade();
	}
	
	//관람등급등록-ajax
	@RequestMapping(value="insert_wgrade", method=RequestMethod.POST)
	public String insert_wgrade(WatchgradeVO wgvo) throws Exception{
		wgservice.insert_wgrade(wgvo);
		return "redirect:main";
	}
	
	//관람등급삭제-ajax
	@RequestMapping(value="delete_wgrade", method=RequestMethod.POST)
	public String delete_wgrade(WatchgradeVO wgvo) throws Exception{
		wgservice.delete_wgrade(wgvo);
		return "redirect:main";
	}
}
