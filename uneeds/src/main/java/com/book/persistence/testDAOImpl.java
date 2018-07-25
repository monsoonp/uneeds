package com.book.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class testDAOImpl implements testDAO{

	@Inject SqlSession oraclesqlSession;
	@Inject SqlSession mysqlSession;
	
	private static final String namespace="com.book.mappers.TestMapper";
	
	@Override
	public String selectTime() {
		return mysqlSession.selectOne(namespace+".getTime");
		//return "testTime";
	}

}
