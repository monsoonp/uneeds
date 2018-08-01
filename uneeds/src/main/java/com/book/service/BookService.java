package com.book.service;

import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.book.domain.GenreVO;
import com.book.domain.StoreVO;

public interface BookService {
	public String getTime();
	
	public StringBuffer bookSearch(String text, int start);
	
	public List<StoreVO> selectStore();
	public List<GenreVO> selectGenre(String bsname);
	public Map<String, String> getCate(String bsname, String sgname);
	public List<Document> findBests(String bscate, String sgcate);
}
