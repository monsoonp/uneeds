package com.movie.service;

import java.util.List;

import com.movie.domain.ViewTimetableVO;

//비지니스계층 인터페이스
public interface VTimetableService {
	//상영시간표
	public List<ViewTimetableVO> listall_timetable() throws Exception;
	
	//시간표 검색
	public List<ViewTimetableVO> list_search_timetable(ViewTimetableVO vtvo) throws Exception;
	
}
