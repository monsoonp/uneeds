package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.PayVO;
import com.movie.persistence.PayDAO;


@Service
public class PayServiceImpl implements PayService{

	@Inject
	private PayDAO dao;
	
	@Override
	public void insert_pay(PayVO pvo) throws Exception {
		dao.insertPay(pvo);
	}

	@Override
	public List<PayVO> listall_pay() throws Exception {
		return dao.readPay();
	}

	@Override
	public void delete_pay(PayVO pvo) throws Exception {
		dao.deletePay(pvo);
	}

	@Override
	public void update_pay(PayVO pvo) throws Exception {
		dao.updatePay(pvo);
	}
	
}
