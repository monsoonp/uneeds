package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.RdetailVO;

import com.movie.persistence.RdetailDAO;

@Service
public class RdetailServiceImpl implements RdetailService{

	@Inject
	private RdetailDAO dao;
	
	@Override
	public int timetcd_count(RdetailVO rdvo) throws Exception {
		return dao.timetcd_count(rdvo);
	}

	@Override
	public void insert_reserv1(RdetailVO rdvo) throws Exception {
		dao.insert_reserv1(rdvo);
	}

	@Override
	public void insert_reserv2(RdetailVO rdvo) throws Exception {
		dao.insert_reserv2(rdvo);
	}

	@Override
	public List<RdetailVO> list_seat_ing(RdetailVO rdvo) throws Exception {
		return dao.listseat_ing(rdvo);
	}

	@Override
	public List<RdetailVO> list_seat_complete(RdetailVO rdvo) throws Exception {	
		return dao.listseat_complete(rdvo);
	}

	@Override
	public void insert_reserv4(RdetailVO rdvo) throws Exception {
		dao.insert_reserv4(rdvo);
	}
	
}
