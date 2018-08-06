package com.admin_movie.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.ViewTimetableVO;
import com.movie.service.VTimetableService;

@Controller
public class Amv_vtimetable_Controller {
	
	@Inject
	private VTimetableService vtservice;
	
	//상영테이블리스트-ajax
	@RequestMapping(value="list_VTimetable", method=RequestMethod.GET)
	public @ResponseBody List<ViewTimetableVO> list_Showtype() throws Exception{
		return vtservice.listall_timetable();
	}
	//상영지점별 검색
	@RequestMapping(value="list_searchVTimetable", method=RequestMethod.GET)
	public @ResponseBody List<ViewTimetableVO> list_searchVTimetable(ViewTimetableVO vtvo) throws Exception{
		return vtservice.list_search_timetable(vtvo);
	}
	
}
