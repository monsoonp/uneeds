package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.ShowtypeVO;

@Repository //DAO스프링인식
public class ShowtypeDAOImpl implements ShowtypeDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.ShowtypeMapper";
	
	//상영형태 입력
	@Override
	public void insertShowtype(ShowtypeVO stvo) {
		mysqlSession.insert(mspace+".insertShowtype",stvo);
	}
	
	//상영형태리스트
	@Override
	public List<ShowtypeVO> readShowtype() {	
		return mysqlSession.selectList(mspace+".listShowtype");
	}
	
	//상영형태코드 삭제
	@Override
	public void deleteShowtype(ShowtypeVO stvo) {
		mysqlSession.delete(mspace+".deleteShowtype",stvo);
	}
	
}
