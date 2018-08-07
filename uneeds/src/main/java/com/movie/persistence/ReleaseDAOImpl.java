package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.ReleaseVO;

@Repository //DAO스프링인식
public class ReleaseDAOImpl implements ReleaseDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.ReleaseMapper";

	@Override
	public void insertRelease(ReleaseVO rvo) {
		mysqlSession.insert(mspace+".insertRelease",rvo);
	}

	@Override
	public List<ReleaseVO> readRelease() {
		return mysqlSession.selectList(mspace+".listRelease");
	}

	@Override
	public void deleteRelease(ReleaseVO rvo) {
		mysqlSession.delete(mspace+".deleteRelease",rvo);
	}
}
