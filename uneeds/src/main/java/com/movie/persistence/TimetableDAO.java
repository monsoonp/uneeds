package com.movie.persistence;

import com.movie.domain.TimetableVO;

public interface TimetableDAO {
	//상영시간표등록
	public void insertTimetable(TimetableVO ttvo);
	//상영시간표삭제
	public void deleteTimetable(TimetableVO ttvo);
	
	
	//상영시간코드카운
	public int countrtime(TimetableVO ttvo);
	//극장코드 카운트
	public int theatercd_count(TimetableVO ttvo);
	//지점코드 카운트
	public int tnumcd_count(TimetableVO ttvo);
	
	//입력검사
	public int allcd_count(TimetableVO ttvo);
}
