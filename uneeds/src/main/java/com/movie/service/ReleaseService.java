package com.movie.service;

import java.util.List;

import com.movie.domain.ReleaseVO;

//비지니스계층 인터페이스
public interface ReleaseService {
	//상영영화 입력서비스
	public void insert_release(ReleaseVO rvo) throws Exception;
	
	//상영영화 리스트구현
	public List<ReleaseVO> listall_release() throws Exception;
	
	//상영영화코드 삭제
	public void delete_release(ReleaseVO rvo) throws Exception;
}
