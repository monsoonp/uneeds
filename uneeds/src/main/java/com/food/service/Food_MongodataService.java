package com.food.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.food.persistence.Food_MongodataDAO;
import com.google.common.collect.Lists;
import com.mongodb.client.FindIterable;

@Service
public class Food_MongodataService {
	@Inject
	private Food_MongodataDAO dao;
	
	public List<Document> listAll(String cn) throws Exception {
		// find
		FindIterable<Document> docs = dao.selectBigbirds(cn);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		return list;
	}

}
