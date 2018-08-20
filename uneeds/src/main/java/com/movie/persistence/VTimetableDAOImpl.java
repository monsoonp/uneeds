package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.ViewTimetableVO;

@Repository //DAO스프링인식
public class VTimetableDAOImpl implements VTimetableDAO{
	
	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.VTimetableMapper";

	@Override
	public List<ViewTimetableVO> readVTimetable() {
		return mysqlSession.selectList(mspace+".listVTimetable");
	}

	@Override
	public List<ViewTimetableVO> searchVTimetable(ViewTimetableVO vtvo) {
		return mysqlSession.selectList(mspace+".listsearchTimetable",vtvo);
	}

	@Override
	public String reserv_tname(int timetcd) {
		return mysqlSession.selectOne(mspace+".reserv_tname",timetcd);
	}
	
}
