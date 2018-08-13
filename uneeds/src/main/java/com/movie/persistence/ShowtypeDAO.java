package com.movie.persistence;

import java.util.List;

import com.movie.domain.ShowtypeVO;

public interface ShowtypeDAO {
	//상영형태입력
	public void insertShowtype(ShowtypeVO stvo);
	//상영형태읽어오기
	public List<ShowtypeVO> readShowtype();
	//상영형태코드삭제
	public void deleteShowtype(ShowtypeVO stvo);
	
	
}
