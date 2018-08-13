package com.medical.persistence;


import java.util.List;

import com.medical.domain.CheckListVO;
import com.medical.domain.KindsVO;
import com.medical.domain.SidoVO;
import com.medical.domain.SigunVO;
import com.medical.domain.ThemaVO;
import com.medical.domain.TimetableVO;

public interface SelectDAO {
	
	// checkList
	public List<CheckListVO> checkList() throws Exception;
	
	//timetable
	public List<TimetableVO> timetableView() throws Exception;
	
}
