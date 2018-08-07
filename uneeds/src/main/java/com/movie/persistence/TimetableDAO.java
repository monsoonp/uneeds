package com.movie.persistence;

import com.movie.domain.TimetableVO;

public interface TimetableDAO {
	//상영시간표등록
	public void insertTimetable(TimetableVO ttvo);
	//상영시간표삭제
	public void deleteTimetable(TimetableVO ttvo);
}
