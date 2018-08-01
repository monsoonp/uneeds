package com.movie.service;

import java.util.List;

import com.movie.domain.RtimeVO;

//비지니스계층 인터페이스
public interface RtimeService {
	//상영시간 입력서비스
	public void insert_rtime(RtimeVO rvo) throws Exception;
	
	//상영시간 리스트구현
	public List<RtimeVO> listall_rtime() throws Exception;
	
	//상영시간코드 삭제
	public void delete_rtime(RtimeVO rvo) throws Exception;
}
