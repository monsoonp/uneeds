package com.book.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.book.persistence.testDAO;

@Service
public class testServiceImpl implements testService{
	
	@Inject
	private testDAO dao;
	
	@Override
	public String getTime() {
		return dao.selectTime();
	}
}
