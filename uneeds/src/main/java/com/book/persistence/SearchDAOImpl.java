package com.book.persistence;

import org.springframework.stereotype.Repository;

import com.book.util.NaverSearch;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Override
	public StringBuffer search(String text, int start) {
		NaverSearch ns = new NaverSearch();
		StringBuffer sb = ns.booksearch(text, start);
		System.out.println(sb);
		return sb;
	}

}
