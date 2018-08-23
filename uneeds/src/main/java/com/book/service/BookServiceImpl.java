package com.book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.book.domain.AutoVO;
import com.book.domain.BookInfoVO;
import com.book.domain.BookVO;
import com.book.domain.GenreVO;
import com.book.domain.PriceVO;
import com.book.domain.StoreVO;
import com.book.persistence.BestsellerDAO;
import com.book.persistence.BookDAO;
import com.book.persistence.SearchDAO;
import com.book.util.NaverSearch;
import com.google.common.collect.Lists;
import com.mongodb.client.FindIterable;

@Service
public class BookServiceImpl implements BookService{
	
	@Inject
	BestsellerDAO bDao;
	@Inject
	SearchDAO sDao;
	@Inject
	BookDAO bookDao;
	
	@Override
	public String getTime() {
		return bDao.selectTime();
	}
	
	@Override
	public StringBuffer bookSearch(String text, int start) {
		return sDao.search(text, start);
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
	public List<Document> findBests(String bscate, String sgcate, String usercode) {
		// find()
		FindIterable<Document> docs = bDao.bestList(bscate, sgcate);
		List<Document> newList = new ArrayList<Document>();
		Document b2 = new Document();
		System.out.println(docs.toString());
		for (Document doc : docs) {
			
			ArrayList<Document> list = (ArrayList<Document>) ( doc.get("bookList"));
			
			for (int i=0; i<list.size(); i++) {
				Document d= list.get(i);
				System.out.println(d.toString());
				Document d1 = (Document) d.get("result");
				ArrayList<Document> b = (ArrayList<Document>) d1.get("items");
				d1=b.get(0);
				String isbn = d1.get("isbn").toString();
				if (isbn.contains(">")) {
					isbn = isbn.split(">")[1].split("<")[0].toString();
				}
				b2 = new Document();
				b2.append("check", checkPoint(usercode, isbn));
				newList.add(i, b2);
			}
		}
		
		b2 = new Document();
		b2.append("bookmark", newList);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		list.add(b2);
		System.out.println("check!: "+list.toString());
		return list;
	}


	@Override
	public void insertBook(BookInfoVO infoVO) {
		bookDao.insertBook(infoVO);
	}

	@Override
	public void pointBook(Map<String, Object> point) {
		bookDao.pointBook(point);
	}

	@Override
	public int checkPoint(String usercode, String isbn) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usercode", usercode);
		map.put("isbn", isbn);
		return bookDao.checkPoint(map);
	}
	
	@Override
	public List<BookVO> bookmark(String usercode) {
		return bookDao.bookmark(usercode);
	}
	
	@Override
	public List<AutoVO> autocomplete(String query) {
		return sDao.autoComplete(query);
	}
	
	@Override
	public List<BookVO> countBook() {
		return bookDao.countBook();
	}

	
}
