package com.movie.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.MovieVO;
import com.movie.service.MovieService;


@Controller
public class Moviedetail_Controller {
	
	@Inject
	private MovieService mservice;
	
	//박스오피스 이미지패스 찾기
	@RequestMapping(value="get_imgpath", method=RequestMethod.POST)
	public @ResponseBody String get_imgpath(MovieVO mvo) throws Exception{
		String path="";
		path= "/resources/movie/img/"+mservice.get_imgpath(mvo);
		return path;
	}
	
	//보유영화
	@RequestMapping(value="list_Movies", method=RequestMethod.GET)
	public @ResponseBody List<MovieVO> list_Movies() throws Exception{
		return mservice.listall_movie();
	}
	
}
