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

	@Override
	public int showtycd_count(ReleaseVO rvo) {
		return mysqlSession.selectOne(mspace+".showtycd_count",rvo);
	}

	@Override
	public int moviecd_count(ReleaseVO rvo) {
		return mysqlSession.selectOne(mspace+".moviecd_count",rvo);
	}

	@Override
	public int releaseall_count(ReleaseVO rvo) {
		return mysqlSession.selectOne(mspace+".releaseall_count",rvo);
	}
}
