package com.admin_movie.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.movie.domain.TimetableVO;
import com.movie.service.TimetableService;


@Controller
public class Amv_timetable_Controller {
	
	@Inject
	private TimetableService ttservice;
	
	//상영형태등록-ajax
	@RequestMapping(value="insert_Timetable", method=RequestMethod.POST)
	public String insert_Timetable(TimetableVO ttvo) throws Exception{
		ttservice.insert_timetable(ttvo);
		return "redirect:main";
	}
	
	//상영형태삭제-ajax
	@RequestMapping(value="delete_Timetable", method=RequestMethod.POST)
	public String delete_Timetable(TimetableVO ttvo) throws Exception{
		ttservice.delete_timetable(ttvo);
		return "redirect:main";
	}
}
