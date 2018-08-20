package com.movie.persistence;

import com.movie.domain.RdetailVO;

public interface RdetailDAO {
	//시간표코드카운팅
	public int timetcd_count(RdetailVO rdvo);
	
	//1차 예매정보입력
	public void insert_reserv1(RdetailVO rdvo);
	
}
