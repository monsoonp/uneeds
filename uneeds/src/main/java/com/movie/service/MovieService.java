package com.movie.service;

import java.util.List;

import com.movie.domain.MovieVO;
//비지니스계층 인터페이스
public interface MovieService {
	//영화 입력서비스
	public void insert_movie(MovieVO mvo) throws Exception;
	
	//영화 리스트구현
	public List<MovieVO> listall_movie() throws Exception;
	
	//영화 삭제
	public void delete_movie(MovieVO mvo) throws Exception;
	
	
	public int wgradecd_count(MovieVO mvo) throws Exception;
}
