package com.book.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class testDAOImpl implements testDAO{

	@Inject SqlSession sqlSessionOracle;
	@Inject SqlSession sqlSessionMySql;
	
	private static final String namespace="com.book.mappers.TestMapper";
	
	@Override
	public String selectTime() {
		return sqlSessionMySql.selectOne(namespace+".getTime");
	}

}
