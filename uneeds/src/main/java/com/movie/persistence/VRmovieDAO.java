package com.movie.persistence;

import java.util.List;

import com.movie.domain.ViewRmovieVO;

public interface VRmovieDAO {
	//상영영화뷰읽어오기
	public List<ViewRmovieVO> readVRmovie();
}
