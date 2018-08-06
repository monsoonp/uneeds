package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.ViewRmovieVO;

import com.movie.service.VRmovieService;

@Controller
public class Amv_vrmovie_Controller {
	
	@Inject
	private VRmovieService vrservice;
	
	//뷰리스트
	@RequestMapping(value="list_VRmovie", method=RequestMethod.GET)
	public @ResponseBody List<ViewRmovieVO> list_VRmovie() throws Exception{
		return vrservice.listall_vrmovie();
	}

}
