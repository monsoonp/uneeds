package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.ViewTotalreservVO;

@Repository //DAO스프링인식
public class VTotalreservDAOImpl implements VTotalreservDAO{
	
	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.VTotalreservMapper";

	@Override
	public List<ViewTotalreservVO> listVTotalreserv_admin() {
		return mysqlSession.selectList(mspace+".listVTotalreserv");
	}
}
