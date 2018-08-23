package com.book.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.book.domain.BookInfoVO;
import com.book.domain.BookVO;

public interface BookDAO {
	
	public void insertBook(BookInfoVO infoVO);
	
	public void pointBook(Map<String, Object> point); 
	
	public int checkPoint(Map<String, Object> point);
	
	public List<BookVO> bookmark(String usercode);
	
	public List<BookVO> countBook();
	
	public List<BookVO> recommendBook(String isbn);
}
