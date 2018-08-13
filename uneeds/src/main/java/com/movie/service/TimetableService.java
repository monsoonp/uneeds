package com.movie.service;

import com.movie.domain.TimetableVO;

//비지니스계층 인터페이스
public interface TimetableService {
	//상영시간표입력서비스
	public void insert_timetable(TimetableVO ttvo) throws Exception;
	//상영시간표 삭제
	public void delete_timetable(TimetableVO ttvo) throws Exception;
	
	//rtimecd 카운팅
	public int count_rtimecd(TimetableVO ttvo) throws Exception;
	//지점코드카운팅
	public int theatercd_count(TimetableVO ttvo) throws Exception;
	//상영관코드
	public int tnumcd_count(TimetableVO ttvo) throws Exception;
	
	//시간표 입력검사
	public int allcd_count(TimetableVO ttvo) throws Exception;
	
}
