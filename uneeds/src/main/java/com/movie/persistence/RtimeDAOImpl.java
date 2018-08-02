package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.RtimeVO;

@Repository //DAO스프링인식
public class RtimeDAOImpl implements RtimeDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.RtimeMapper";

	//상영시간등록
	@Override
	public void insertRtime(RtimeVO rvo) {
		mysqlSession.insert(mspace+".insertRtime",rvo);
	}
	//상영시간리스트
	@Override
	public List<RtimeVO> readRtime() {
		return mysqlSession.selectList(mspace+".listRtime");
	}
	//상영시간삭제
	@Override
	public void deleteRtime(RtimeVO rvo) {
		mysqlSession.delete(mspace+".deleteRtime",rvo);
	}
	
}
