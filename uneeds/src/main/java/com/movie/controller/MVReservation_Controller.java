package com.movie.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.domain.RdetailVO;
import com.movie.domain.TheaterVO;
import com.movie.domain.ViewRmovieVO;
import com.movie.domain.ViewTimetableVO;
import com.movie.service.RdetailService;
import com.movie.service.TheaterService;
import com.movie.service.VRmovieService;
import com.movie.service.VTimetableService;


@Controller
public class MVReservation_Controller {
	
	@Inject
	private VRmovieService vrservice;
	
	@Inject
	private TheaterService tservice;
	
	@Inject
	private VTimetableService vtservice;
	
	@Inject
	private RdetailService rdservice;
	
	
	//상영영화
	@RequestMapping(value="list_VRmovie_user", method=RequestMethod.GET)
	public @ResponseBody List<ViewRmovieVO> list_VRmovie_user() throws Exception{
		return vrservice.user_listall_vrmovie();
	}
	
	//극장
	@RequestMapping(value="list_Theater_user", method=RequestMethod.GET)
	public @ResponseBody List<TheaterVO> list_Theater_user() throws Exception{
		return tservice.listall_Theater();
	}
	
	//상영지점별 검색
	@RequestMapping(value="list_searchVTimetable_user", method=RequestMethod.GET)
	public @ResponseBody List<ViewTimetableVO> list_searchVTimetable_user(ViewTimetableVO vtvo) throws Exception{
		return vtservice.list_search_timetable(vtvo);
	}

	//자리선택
	@RequestMapping(value = "/reserv_seat", method = RequestMethod.POST)
	public String reserv_seat(Model m, HttpServletRequest req, RdetailVO rdvo) throws Exception{
		
		req.setCharacterEncoding("UTF-8");
		
		long cd = System.currentTimeMillis();
		String cdd=new SimpleDateFormat("yyMMddHHmmssSSS").format(cd);		
		int code = Integer.parseInt(cdd.substring(2, 4)+cdd.substring(9));
		
		System.out.println("code: "+code);
		rdvo.setRedetailcd(code);
		
		//1차정보입력
		//rdservice.insert_reserv1(rdvo);
		
		String acode = rdvo.getPeoplecd().substring(1,2);
		String scode = rdvo.getPeoplecd().substring(3,4);
		
		
		List<ViewRmovieVO> listvrvo = new ArrayList<>();
		listvrvo=vrservice.reserv_movietype(rdvo.getUmoviecd());
		String movietype="";
		for (ViewRmovieVO vrvo : listvrvo) {
			movietype = vrvo.getMoviename() +" "+ vrvo.getShowtyname();
		}
		
		//지점명
		String tname = vtservice.reserv_tname(rdvo.getTimetcd());
		//상영코드 영화제목
		//지점명
		//입력날짜
		//날짜
		//인원코드
		
		
			
		Map<String, String> remap = new HashMap<>();
		remap.put("rtime", req.getParameter("rtime").toString());
		remap.put("rselectdate", req.getParameter("rselectdate"));
		remap.put("rprice", req.getParameter("rprice").toString());
		remap.put("imgpath", req.getParameter("imgpath").toString());
		remap.put("amountT", "성인 "+acode+"명, 학생  "+scode+"명");
		remap.put("rmovie", movietype);
		remap.put("rtheater", tname);
		
		
		m.addAttribute("remap", remap);
		m.addAttribute("rdvo",rdvo);

		return "reservation2";
	}
}
