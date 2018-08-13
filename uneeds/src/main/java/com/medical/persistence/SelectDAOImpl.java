package com.medical.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.medical.domain.CheckListVO;
import com.medical.domain.TimetableVO;


@Repository
public class SelectDAOImpl implements SelectDAO {

	@Inject
	private SqlSession mysqlSession; 
	
	private static final String namespace = "com.medical.mappers.medicalMapper";
	

	@Override
	public List<CheckListVO> checkList() throws Exception {
		return mysqlSession.selectList(namespace+ ".selectCheck");
	}


	@Override
	public List<TimetableVO> timetableView() throws Exception {
		return mysqlSession.selectList(namespace+".selectTime");
	}

}
