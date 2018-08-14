package com.medical.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.bson.Document;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.medical.domain.CheckListVO;
import com.medical.domain.MedicalVO;
import com.medical.domain.TimetableVO;
import com.medical.persistence.InsertDAO;
import com.medical.persistence.MongoDAO;
import com.medical.persistence.SelectDAO;
import com.mongodb.client.FindIterable;


@Service
public class Medical_serviceImpl implements Medical_service {

	@Inject
	private MongoDAO dao;
	
	@Inject
	private SelectDAO dao2;


	@Override
	public List<Document> listAll(MedicalVO m) throws Exception {
		FindIterable<Document> docs = dao.insertMedicals(m);
		// FindIterable을 iterator로 변환
		Iterator<Document> it = docs.iterator();
		// iterator를 List<Document> 변환
		List<Document> list = Lists.newArrayList(it);
		return list;
	}


	@Override
	public List<CheckListVO> checkListView() throws Exception {
		return dao2.checkList();
	}


	@Override
	public List<TimetableVO> timetableView() throws Exception {
		return dao2.timetableView();
	}








}
