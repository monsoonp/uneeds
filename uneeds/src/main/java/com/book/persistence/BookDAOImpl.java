package com.book.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.book.domain.BookInfoVO;
import com.book.domain.BookVO;

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

	@Override
	public List<BookVO> bookmark(String usercode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usercode", usercode);
		return mysqlSession.selectList(namespace+".bookmark", map);
	}
	
	@Override
	public List<BookVO> countBook() {
		return mysqlSession.selectList(namespace+".countBook");
	}
	
	@Override
	public List<BookVO> recommendBook(String isbn) {
		return mysqlSession.selectList(namespace+".recommendBook", isbn);
	}
}
