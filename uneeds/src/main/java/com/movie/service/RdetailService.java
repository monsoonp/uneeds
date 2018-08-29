package com.movie.service;

import java.util.List;

import com.movie.domain.RdetailVO;

//비지니스계층 인터페이스
public interface RdetailService {
	//시간표코드 카운팅
	public int timetcd_count(RdetailVO rdvo) throws Exception;
	
	//1차 예매정보 입력
	public void insert_reserv1(RdetailVO rdvo) throws Exception;
	
	//2차 좌석정보입력
	public void insert_reserv2(RdetailVO rdvo) throws Exception;
	
	
	//4차 완료
	public void insert_reserv4(RdetailVO rdvo) throws Exception;
		
	
	//예매진행중좌석
	public List<RdetailVO> list_seat_ing(RdetailVO rdvo) throws Exception;
	//예매완료좌석
	public List<RdetailVO> list_seat_complete(RdetailVO rdvo) throws Exception;
	
}
