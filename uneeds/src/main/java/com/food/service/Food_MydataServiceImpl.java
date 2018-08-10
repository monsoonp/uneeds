package com.food.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.Food_dataVo;
import com.food.domain.Food_searchVo;
import com.food.persistence.Food_MydataDAO;

@Service
public class Food_MydataServiceImpl implements Food_MydataService{

	@Inject
	Food_MydataDAO dao;
	
	@Override
	public List<Food_dataVo> searchFood(Food_searchVo svo) throws Exception {
		return dao.searchFood(svo);
	}

	@Override
	public int countpage(Food_searchVo svo){
		return dao.countPaging(svo);
	}

	@Override
	public int countpage_kid(Food_searchVo svo) {
		return dao.countPaging_kid(svo);
	}

}
