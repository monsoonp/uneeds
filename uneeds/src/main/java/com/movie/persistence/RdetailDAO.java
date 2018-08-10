package com.movie.persistence;

import com.movie.domain.RdetailVO;

public interface RdetailDAO {
	//시간표코드카운팅
	public int timetcd_count(RdetailVO rdvo);
}
