package com.movie.persistence;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.movie.domain.ReservVO;

@Repository //DAO스프링인식
public class ReservDAOImpl implements ReservDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.ReservMapper";

	@Override
	public void insertReserv(ReservVO rvo) {
		mysqlSession.insert(mspace+".insertReserv",rvo);
	}
	
}
