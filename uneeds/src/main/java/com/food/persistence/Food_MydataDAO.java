package com.food.persistence;

import java.util.List;
import com.food.domain.Food_dataVo;

public interface Food_MydataDAO {
	public void insertData(Food_dataVo vo);
	public List<Food_dataVo> selectFood();
	public List<Food_dataVo> searchFood(Food_dataVo vo);
	
}
