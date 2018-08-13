package com.medical.service;


import java.util.List;
import org.bson.Document;

import com.medical.domain.CheckListVO;
import com.medical.domain.MedicalVO;
import com.medical.domain.SidoVO;
import com.medical.domain.TimetableVO;



public interface Medical_service {

	// 약국 목록을 mongodb에 저장
	public List<Document> listAll(MedicalVO m) throws Exception; 
	
	// checklist
	public List<CheckListVO> checkListView() throws Exception;

	// reservation time
	public List<TimetableVO> timetableView() throws Exception;


}
