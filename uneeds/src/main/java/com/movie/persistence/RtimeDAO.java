package com.movie.persistence;

import java.util.List;

import com.movie.domain.RtimeVO;

public interface RtimeDAO {
	//상영시간등록
	public void insertRtime(RtimeVO rvo);
	//상영시간목록
	public List<RtimeVO> readRtime();
	//상영시간삭제
	public void deleteRtime(RtimeVO rvo);
}
