package com.movie.service;

import com.movie.domain.RdetailVO;

//비지니스계층 인터페이스
public interface RdetailService {
	//시간표코드 카운팅
	public int timetcd_count(RdetailVO rdvo) throws Exception;
	
}
