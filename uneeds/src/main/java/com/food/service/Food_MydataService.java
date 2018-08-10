package com.food.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.food.domain.Food_dataVo;
import com.food.domain.Food_searchVo;

public interface Food_MydataService {
	
	public List<Food_dataVo> searchFood(Food_searchVo svo) throws Exception;
	public int countpage(Food_searchVo svo);
	public int countpage_kid(Food_searchVo svo);
}
