package com.main.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject SqlSession mysqlSession;
	
	private static final String namespace="com.main.mappers.MainMapper";
	
	
	//현재 시간
	@Override
	public String selectTime() {
		return mysqlSession.selectOne(namespace+".getTime");
	}
}
