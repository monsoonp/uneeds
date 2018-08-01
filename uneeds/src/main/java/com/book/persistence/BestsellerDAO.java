package com.book.persistence;

import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.book.domain.GenreVO;
import com.book.domain.StoreVO;
import com.mongodb.client.FindIterable;

public interface BestsellerDAO {
	public String selectTime();
	
	public List<StoreVO> storeList();
	public List<GenreVO> genreList(String bsname);
	
	public Map<String, String> getCate(String bsname, String sgname);
	public FindIterable<Document> bestList(String bscate, String sgcate);	
	
}
