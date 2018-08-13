package com.admin_movie.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//상영시간count
	@RequestMapping(value="count_rtimecd", method=RequestMethod.POST)
	public @ResponseBody int count_rtimecd(TimetableVO ttvo) throws Exception{
		int x = ttservice.count_rtimecd(ttvo);
		return x;
	}
	//지점코드카운트
	@RequestMapping(value="theatercd_count", method=RequestMethod.POST)
	public @ResponseBody int theatercd_count(TimetableVO ttvo) throws Exception{
		int x = ttservice.theatercd_count(ttvo);
		return x;
	}
	
	//입력검사카운트
	@RequestMapping(value="allcd_count", method=RequestMethod.POST)
	public @ResponseBody int allcd_count(TimetableVO ttvo) throws Exception{
		int x = ttservice.allcd_count(ttvo);
		return x;
	}	
}
