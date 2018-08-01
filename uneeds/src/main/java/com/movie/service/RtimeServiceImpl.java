package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.RtimeVO;
import com.movie.persistence.RtimeDAO;

@Service
public class RtimeServiceImpl implements RtimeService{

	@Inject
	private RtimeDAO dao;
	
	@Override
	public void insert_rtime(RtimeVO rvo) throws Exception {
		dao.insertRtime(rvo);
	}

	@Override
	public List<RtimeVO> listall_rtime() throws Exception {
		return dao.readRtime();
	}

	@Override
	public void delete_rtime(RtimeVO rvo) throws Exception {
		dao.deleteRtime(rvo);
	}
	
}
