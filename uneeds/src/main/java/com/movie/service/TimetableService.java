package com.movie.service;

import com.movie.domain.TimetableVO;

//비지니스계층 인터페이스
public interface TimetableService {
	//상영시간표입력서비스
	public void insert_timetable(TimetableVO ttvo) throws Exception;
	//상영시간표 삭제
	public void delete_timetable(TimetableVO ttvo) throws Exception;
}
