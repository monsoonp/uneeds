package com.movie.persistence;

import java.util.List;

import com.movie.domain.ViewTimetableVO;

public interface VTimetableDAO {
	//상영시간표리스트
	public List<ViewTimetableVO> readVTimetable();
	
	//지점별상영시간표검색
	public List<ViewTimetableVO> searchVTimetable(ViewTimetableVO vtvo);

}
