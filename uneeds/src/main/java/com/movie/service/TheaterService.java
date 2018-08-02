package com.movie.service;

import java.util.List;

import com.movie.domain.TheaterVO;

//비지니스계층 인터페이스
public interface TheaterService {
	//영화관지점 입력서비스
	public void insert_Theater(TheaterVO tvo) throws Exception;
	
	//영화관지점 리스트구현
	public List<TheaterVO> listall_Theater() throws Exception;
	
	//영화관지점 삭제
	public void delete_Theater(TheaterVO tvo) throws Exception;
}
