package com.food.persistence;

import java.util.List;
import com.food.domain.Food_dataVo;
import com.food.domain.Food_reservationVo;
import com.food.domain.Food_searchVo;

public interface Food_MydataDAO {
	public void insertData(Food_dataVo vo);
	public List<Food_dataVo> selectFood();
	public List<Food_dataVo> searchFood(Food_searchVo svo) throws Exception;
	public List<Food_dataVo> searchFood_kind(Food_searchVo svo) throws Exception;
	public int countPaging(Food_searchVo svo);
	public int countPaging_kid(Food_searchVo svo);
	public Food_dataVo detail(Integer fid);
	public Food_dataVo detail_like(Integer fid);
	public List<Food_reservationVo> rstype();
	public List<Food_reservationVo> rstime();
	public void insertReservation(Food_reservationVo rvo);
	public List<Food_reservationVo> reservationFood(Food_reservationVo rvo);
}
