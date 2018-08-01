package com.movie.service;

import java.util.List;

import com.movie.domain.ShowtypeVO;

//비지니스계층 인터페이스
public interface ShowtypeService {
	//상영형태 입력서비스
	public void insert_showtype(ShowtypeVO stvo) throws Exception;
	
	//상영형태 리스트구현
	public List<ShowtypeVO> listall_showtype() throws Exception;
	
	//상영형태코드 삭제
	public void delete_showtype(ShowtypeVO stvo) throws Exception;
}
