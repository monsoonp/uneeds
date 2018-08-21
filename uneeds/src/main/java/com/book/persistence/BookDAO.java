package com.book.persistence;

import java.util.HashMap;
import java.util.Map;

import com.book.domain.BookInfoVO;

public interface BookDAO {
	
	public void insertBook(BookInfoVO infoVO);
	
	public void pointBook(Map<String, Object> point); 
	
	public int checkPoint(Map<String, Object> point);
	
}
