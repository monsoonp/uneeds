package com.book.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.book.domain.AutoVO;
import com.book.util.NaverSearch;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Inject SqlSession mysqlSession;
	private static final String namespace="com.book.mappers.BookMapper";
	
	@Override
	public StringBuffer search(String text, int start) {
		NaverSearch ns = new NaverSearch();
		StringBuffer sb = ns.booksearch(text, start);
		System.out.println(sb);
		return sb;
	}

	@Override
	public List<AutoVO> autoComplete(String query) {
		return mysqlSession.selectList(namespace+".autocomplete", query);
	}
}
