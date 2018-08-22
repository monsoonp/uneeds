package com.book.service;

import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.book.domain.AutoVO;
import com.book.domain.BookInfoVO;
import com.book.domain.BookVO;
import com.book.domain.GenreVO;
import com.book.domain.PriceVO;
import com.book.domain.StoreVO;

public interface BookService {
	public String getTime();
	
	public StringBuffer bookSearch(String text, int start);
	
	public List<StoreVO> selectStore();
	public List<GenreVO> selectGenre(String bsname);
	public Map<String, String> getCate(String bsname, String sgname);
	public List<Document> findBests(String bscate, String sgcate, String usercode);
	
	public void insertBook(BookInfoVO infoVO);
	public void pointBook(Map<String, Object> map);
	
	public int checkPoint(String usercode, String isbn);
	
	public List<BookVO> bookmark(String usercode);
	public List<AutoVO> autocomplete(String query);
}
