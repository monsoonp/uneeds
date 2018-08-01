package com.exhibition.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.exhibition.domain.ExhibitionVO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.uneeds.mapper.ExhibitionMapper";

	@Override
	public void insertExhi(ExhibitionVO vo) {
		// TODO Auto-generated method stub
		session.insert(namespace+ ".insertExhi", vo);

	}


	
}
