package com.movie.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.movie.domain.ReservVO;
import com.movie.persistence.ReservDAO;


@Service
public class ReservServiceImpl implements ReservService{

	@Inject
	private ReservDAO dao;
	
	@Override
	public void insert_reserv(ReservVO rvo) throws Exception {
		dao.insertReserv(rvo);
	}
	
}
