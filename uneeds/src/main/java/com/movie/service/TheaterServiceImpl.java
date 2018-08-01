package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.TheaterVO;
import com.movie.persistence.TheaterDAO;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	@Inject
	private TheaterDAO dao;
	
	
	//영화관지점입력
	@Override
	public void insert_Theater(TheaterVO tvo) throws Exception {
		dao.insertTheater(tvo);
	}

	//영화관지점리스트
	@Override
	public List<TheaterVO> listall_Theater() throws Exception {
		return dao.readTheater();
	}

	//영화관지점삭제
	@Override
	public void delete_Theater(TheaterVO tvo) throws Exception {
		dao.deleteTheater(tvo);
	}
}
