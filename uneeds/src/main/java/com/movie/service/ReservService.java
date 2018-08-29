package com.movie.service;

import com.movie.domain.ReservVO;

//비지니스계층 인터페이스
public interface ReservService {
	//예약완료입력
	public void insert_reserv(ReservVO rvo) throws Exception;
}
