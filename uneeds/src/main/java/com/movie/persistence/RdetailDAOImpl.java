package com.movie.persistence;

import java.util.List;

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

	@Override
	public void insert_reserv2(RdetailVO rdvo) {
		mysqlSession.insert(mspace+".update_reserv2",rdvo);
	}

	@Override
	public List<RdetailVO> listseat_ing(RdetailVO rdvo) {
		return mysqlSession.selectList(mspace+".listseat_ing", rdvo);
	}

	@Override
	public List<RdetailVO> listseat_complete(RdetailVO rdvo) {
		return mysqlSession.selectList(mspace+".listseat_complete", rdvo);
	}

	@Override
	public void insert_reserv4(RdetailVO rdvo) {
		mysqlSession.insert(mspace+".update_reserv4",rdvo);
	}
}
