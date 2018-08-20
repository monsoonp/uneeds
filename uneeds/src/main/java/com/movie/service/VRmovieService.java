package com.movie.service;

import java.util.List;

import com.movie.domain.ViewRmovieVO;

//비지니스계층 인터페이스
public interface VRmovieService {
	//상영형태 리스트구현
	public List<ViewRmovieVO> listall_vrmovie() throws Exception;
	
	//사용자뷰
	public List<ViewRmovieVO> user_listall_vrmovie() throws Exception;
	
	//예매용 영화티입
	public List<ViewRmovieVO> reserv_movietype(int umoviecd) throws Exception;
	
}
