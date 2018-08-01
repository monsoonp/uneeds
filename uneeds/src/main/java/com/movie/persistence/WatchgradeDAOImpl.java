package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.WatchgradeVO;

@Repository //DAO스프링인식
public class WatchgradeDAOImpl implements WatchgradeDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.WatchgradeMapper";
	
	@Override
	public void insertWatchgrade(WatchgradeVO wgvo) {
		mysqlSession.insert(mspace+".insertWatchgrade",wgvo);
	}

	@Override
	public List<WatchgradeVO> readWatchgrade() {
		return mysqlSession.selectList(mspace+".listWatchgrade");
	}

	@Override
	public void deleteWatchgrade(WatchgradeVO wgvo) {
		mysqlSession.delete(mspace+".deleteWatchgrade",wgvo);
	}
}
