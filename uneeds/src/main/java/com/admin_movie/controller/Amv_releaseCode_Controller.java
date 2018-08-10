package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.ReleaseVO;
import com.movie.service.ReleaseService;

@Controller
public class Amv_releaseCode_Controller {
	
	@Inject
	private ReleaseService rservice;
	
	//상영영화리스트-ajax
	@RequestMapping(value="list_Release", method=RequestMethod.GET)
	public @ResponseBody List<ReleaseVO> list_Release() throws Exception{
		return rservice.listall_release();
	}
	
	//상영영화등록-ajax
	@RequestMapping(value="insert_Release", method=RequestMethod.POST)
	public String insert_Release(ReleaseVO rvo) throws Exception{
		rservice.insert_release(rvo);
		return "redirect:main";
	}
	
	//상영영화삭제-ajax
	@RequestMapping(value="delete_Release", method=RequestMethod.POST)
	public String delete_Release(ReleaseVO rvo) throws Exception{
		rservice.delete_release(rvo);
		return "redirect:main";
	}
	
	@RequestMapping(value="showtycd_count", method=RequestMethod.POST)
	public @ResponseBody int showtycd_count(ReleaseVO rvo) throws Exception{
		int x = rservice.showtycd_count(rvo);
		return x;
	}
	
	@RequestMapping(value="moviecd_count", method=RequestMethod.POST)
	public @ResponseBody int moviecd_count(ReleaseVO rvo) throws Exception{
		int x = rservice.moviecd_count(rvo);
		return x;
	}
	
	//상영영화입력검사
	@RequestMapping(value="releaseall_count", method=RequestMethod.POST)
	public @ResponseBody int releaseall_count(ReleaseVO rvo) throws Exception{
		int x = rservice.releaseall_count(rvo);
		return x;
	}
}
