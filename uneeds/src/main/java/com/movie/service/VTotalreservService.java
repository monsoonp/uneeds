package com.movie.service;

import java.util.List;

import com.movie.domain.ViewTotalreservVO;

//비지니스계층 인터페이스
public interface VTotalreservService {
	//관리자 예매영화상세
	public List<ViewTotalreservVO> listVTotalreserv_admin() throws Exception;
	
	
}
