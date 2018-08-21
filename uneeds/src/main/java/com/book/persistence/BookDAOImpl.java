package com.book.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.book.domain.BookInfoVO;

@Repository
public class BookDAOImpl implements BookDAO{

	@Inject SqlSession mysqlSession;
	private static final String namespace="com.book.mappers.BookMapper";
	
	@Override
	public void insertBook(BookInfoVO infoVO) {
		mysqlSession.insert(namespace+".insertBook", infoVO);
	}

	@Override
	public void pointBook(Map<String, Object> point) {
		mysqlSession.insert(namespace+".pointBook", point);
	}

	@Override
	public int checkPoint(Map<String, Object> point) {
		return mysqlSession.selectOne(namespace+".checkPoint", point);
	}

}
