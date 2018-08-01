package com.book.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.bson.Document;
import org.springframework.stereotype.Repository;

import com.book.domain.GenreVO;
import com.book.domain.StoreVO;
import com.book.util.MongoUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

@Repository
public class BestsellerDAOImpl implements BestsellerDAO {

	@Inject SqlSession oraclesqlSession;
	@Inject SqlSession mysqlSession;
	
	private static final String namespace="com.book.mappers.BookMapper";
	
	//현재 시간
	@Override
	public String selectTime() {
		return mysqlSession.selectOne(namespace+".getTime");
	}

	//인터넷 서점 목록
	@Override
	public List<StoreVO> storeList() {
		return mysqlSession.selectList(namespace+".storeList");
	}
	//서점별 장르 목록
	@Override
	public List<GenreVO> genreList(String bsname) {
		return mysqlSession.selectList(namespace+".genreList", bsname);
	}

	// 이름으로 카테고리 가져오기
	@Override
	public Map<String, String> getCate(String bsname, String sgname) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("bsname", bsname);
		m.put("sgname", sgname);
		return mysqlSession.selectOne(namespace+".selectCate", m);
	}
	
	// mongodb 베스트셀러 리스트
	@Override
	public FindIterable<Document> bestList(String bscate, String sgcate) {
		//top10
		// 컬렉션
		MongoCollection<Document> col = MongoUtil.getCollection("uneeds_book", "bestseller");
		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		System.out.println(bscate+", "+sgcate);
		obj.add(new BasicDBObject("storeName", bscate));
		obj.add(new BasicDBObject("genreCode", sgcate));
		andQuery.put("$and", obj);
		
		//최근 해당 서점, 장르의 도서 리스트 결과값
		return col.find(andQuery).sort(Filters.eq("date", 1)).limit(1);
		//return col.find().projection(BasicDBObject.parse("{_id:0, id:1, count:1 }")).sort(Filters.eq("count", -1)).limit(7);
	
	}

	

}
