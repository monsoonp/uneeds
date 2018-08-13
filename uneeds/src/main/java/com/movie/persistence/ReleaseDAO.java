package com.movie.persistence;

import java.util.List;

import com.movie.domain.ReleaseVO;

public interface ReleaseDAO {
	//상영영화등록
	public void insertRelease(ReleaseVO rvo);
	//상영영화목록
	public List<ReleaseVO> readRelease();
	//상영영화삭제
	public void deleteRelease(ReleaseVO rvo);
	
	
	//상영형태코드카운
	public int showtycd_count(ReleaseVO rvo);
	
	//영화코드카운
	public int moviecd_count(ReleaseVO rvo);
	
	//입력검사
	public int releaseall_count(ReleaseVO rvo);
}
