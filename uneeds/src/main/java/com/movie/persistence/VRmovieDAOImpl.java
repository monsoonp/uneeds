package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.ViewRmovieVO;

@Repository //DAO스프링인식
public class VRmovieDAOImpl implements VRmovieDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.VRmovieMapper";


	@Override
	public List<ViewRmovieVO> readVRmovie() {
		return mysqlSession.selectList(mspace+".listVRmovie");
	}


	@Override
	public List<ViewRmovieVO> user_readVRmovie() {
		return mysqlSession.selectList(mspace+".user_listVRmovie");
	}

	@Override
	public List<ViewRmovieVO> reserv_movietype(int umoviecd) {
		return mysqlSession.selectList(mspace+".reserv_movietype",umoviecd);
	}

}
