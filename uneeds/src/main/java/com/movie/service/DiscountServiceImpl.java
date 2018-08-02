package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.DiscountVO;
import com.movie.persistence.DiscountDAO;

@Service
public class DiscountServiceImpl implements DiscountService{

	@Inject
	private DiscountDAO dao;
	
	@Override
	public void insert_discount(DiscountVO dvo) throws Exception {
		dao.insertDiscount(dvo);
	}

	@Override
	public List<DiscountVO> listall_discount() throws Exception {
		return dao.readDiscount();
	}

	@Override
	public void delete_discount(DiscountVO dvo) throws Exception {
		dao.deleteDiscount(dvo);
	}

	@Override
	public void update_discount(DiscountVO dvo) throws Exception {
		dao.updateDiscount(dvo);
	}
	
}
