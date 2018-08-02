package com.movie.persistence;

import java.util.List;

import com.movie.domain.TheaterVO;

public interface TheaterDAO {
	//영화관지점입력
	public void insertTheater(TheaterVO tvo);
	//영화관지점리스트
	public List<TheaterVO> readTheater();
	//영화관지점삭제
	public void deleteTheater(TheaterVO tvo);
}
