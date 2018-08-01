package com.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.food.domain.Food_dataVo;

@Repository
public class Food_MydataDAOImpl implements Food_MydataDAO {

	@Inject
	private SqlSession sqlSession; 
	
	private static final String namespace = "com.food.mapper.FoodMapper";

	@Override
	public void insertData(Food_dataVo vo) {
		sqlSession.insert(namespace + ".insertFood", vo);		
	}

	@Override
	public List<Food_dataVo> selectFood() {
		List<Food_dataVo> list = sqlSession.selectList(namespace + ".listFood");
		return list;
	}
	
}
