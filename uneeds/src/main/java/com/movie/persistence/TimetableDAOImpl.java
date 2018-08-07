package com.movie.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.TimetableVO;

@Repository //DAO스프링인식
public class TimetableDAOImpl implements TimetableDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.TimetableMapper";
	
	//시간표등록
	@Override
	public void insertTimetable(TimetableVO ttvo) {
		mysqlSession.insert(mspace+".insertTimetable",ttvo);
	}
	
	//시간표삭제
	@Override
	public void deleteTimetable(TimetableVO ttvo) {
		mysqlSession.delete(mspace+".deleteTimetable",ttvo);
	}
	
}
