package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.TheaterVO;

@Repository //DAO스프링인식
public class TheaterDAOImpl implements TheaterDAO{
	
	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.TheaterMapper";
	
	//영화관지점등록
	@Override
	public void insertTheater(TheaterVO tvo) {
		mysqlSession.insert(mspace+".insertTheater",tvo);
	}
	
	//영화관지점리스트
	@Override
	public List<TheaterVO> readTheater() {
		return mysqlSession.selectList(mspace+".listTheater");
	}

	//영화관지점삭제
	@Override
	public void deleteTheater(TheaterVO tvo) {
		mysqlSession.delete(mspace+".deleteTheater",tvo);
	}

}
