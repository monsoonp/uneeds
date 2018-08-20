package com.movie.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.RdetailVO;

@Repository //DAO스프링인식
public class RdetailDAOImpl implements RdetailDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.RdetailMapper";

	@Override
	public int timetcd_count(RdetailVO rdvo) {
		return mysqlSession.selectOne(mspace+".timetcd_count",rdvo);
	}

	@Override
	public void insert_reserv1(RdetailVO rdvo) {
		mysqlSession.insert(mspace+".insert_reserv1",rdvo);
	}
}
