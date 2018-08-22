package com.book.persistence;

import java.util.List;

import com.book.domain.AutoVO;

public interface SearchDAO {
	public StringBuffer search(String text, int start);
	public List<AutoVO> autoComplete(String query);
}
