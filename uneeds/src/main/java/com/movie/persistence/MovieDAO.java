package com.movie.persistence;

import java.util.List;

import com.movie.domain.MovieVO;

public interface MovieDAO {
	//영화등록
	public void insertMovie(MovieVO mvo);
	//영화리스트
	public List<MovieVO> readMovie();
	//영화삭제
	public void deleteMovie(MovieVO mvo);
	
	//관람등급카운트
	public int wgradecd_count(MovieVO mvo);
}
