package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.MovieVO;

@Repository //DAO스프링인식
public class MovieDAOImpl implements MovieDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.MovieMapper";

	@Override
	public void insertMovie(MovieVO mvo) {
		mysqlSession.insert(mspace+".insertMovie",mvo);
	}

	@Override
	public List<MovieVO> readMovie() {
		return mysqlSession.selectList(mspace+".listMovie");
	}

	@Override
	public void deleteMovie(MovieVO mvo) {
		mysqlSession.delete(mspace+".deleteMovie",mvo);
	}
	
}
