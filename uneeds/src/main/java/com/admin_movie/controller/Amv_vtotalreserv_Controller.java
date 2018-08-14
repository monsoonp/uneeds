package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.ViewTotalreservVO;
import com.movie.service.VTotalreservService;

@Controller
public class Amv_vtotalreserv_Controller {
	
	@Inject
	private VTotalreservService vtrservice;
	
	//관리자 예약상세
	@RequestMapping(value="list_VTotalreserv_admin", method=RequestMethod.GET)
	public @ResponseBody List<ViewTotalreservVO> list_VTotalreserv_admin() throws Exception{
		return vtrservice.listVTotalreserv_admin();
	}	
}
