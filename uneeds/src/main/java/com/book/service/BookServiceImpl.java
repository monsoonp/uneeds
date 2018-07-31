package com.book.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.book.domain.GenreVO;
import com.book.domain.StoreVO;
import com.book.persistence.BestsellerDAO;
import com.book.util.NaverSearch;
import com.google.common.collect.Lists;
import com.mongodb.client.FindIterable;

@Service
public class BookServiceImpl implements BookService{
	
	@Inject
	BestsellerDAO bDao;
	
	@Override
	public String getTime() {
		return bDao.selectTime();
	}
	
	@Override
	public StringBuffer bookSearch(String text, int start) {
		NaverSearch ns = new NaverSearch();
		StringBuffer sb = ns.booksearch(text, start);
		System.out.println(sb);	//stringBuffer 값
		return sb;
	}

	@Override
	public List<StoreVO> selectStore() {
		return bDao.storeList();
	}

	@Override
	public List<GenreVO> selectGenre(String bsname) {
		return bDao.genreList(bsname);
	}
	
	@Override
	public Map<String, String> getCate(String bsname, String sgname) {
		return bDao.getCate(bsname, sgname);
	}

	@Override
	public List<Document> findBests(String bscate, String sgcate) {
		// find()
		FindIterable<Document> docs = bDao.bestList(bscate, sgcate);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		return list;
	}

	

	
}
