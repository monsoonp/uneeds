package com.movie.persistence;

import java.util.List;

import com.movie.domain.ViewRmovieVO;

public interface VRmovieDAO {
	//상영영화뷰읽어오기
	public List<ViewRmovieVO> readVRmovie();
	
	//사용자뷰 - 상영영화
	public List<ViewRmovieVO> user_readVRmovie();
	
	//저장용 영화타입
	public List<ViewRmovieVO> reserv_movietype(int umoviecd);
}
