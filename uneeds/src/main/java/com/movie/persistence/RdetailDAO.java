package com.movie.persistence;

import java.util.List;

import com.movie.domain.RdetailVO;

public interface RdetailDAO {
	//시간표코드카운팅
	public int timetcd_count(RdetailVO rdvo);
	
	//1차 예매정보입력
	public void insert_reserv1(RdetailVO rdvo);
	
	//2차 자리정보입력
	public void insert_reserv2(RdetailVO rdvo);
	
	
	//4차 결제완료
	public void insert_reserv4(RdetailVO rdvo);
		
	
	
	//좌석예매진행중
	public List<RdetailVO> listseat_ing(RdetailVO rdvo);
	
	//좌석예매완료
	public List<RdetailVO> listseat_complete(RdetailVO rdvo);
	
	
}
