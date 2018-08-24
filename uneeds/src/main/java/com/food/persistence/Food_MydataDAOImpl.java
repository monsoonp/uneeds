package com.food.persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.food.domain.Food_dataVo;
import com.food.domain.Food_reservationVo;
import com.food.domain.Food_searchVo;

@Repository
public class Food_MydataDAOImpl implements Food_MydataDAO {

	@Inject
	private SqlSession mysqlSession; 
	
	private static final String namespace = "com.food.mapper.FoodMapper";

	@Override
	public void insertData(Food_dataVo vo) {
		mysqlSession.insert(namespace + ".insertFood", vo);		
	}

	@Override
	public List<Food_dataVo> selectFood() {
		List<Food_dataVo> list = mysqlSession.selectList(namespace + ".listFood");
		return list;
	}

	@Override
	public List<Food_dataVo> searchFood(Food_searchVo svo) throws Exception{
		return mysqlSession.selectList(namespace + ".listSearch", svo);
	}

	@Override
	public Food_dataVo detail(Integer fid) {
		return mysqlSession.selectOne(namespace + ".detail", fid);
	}

	@Override
	public List<Food_dataVo> searchFood_kind(Food_searchVo svo) throws Exception {
		return mysqlSession.selectList(namespace + ".listSearch_kid", svo);
	}

	@Override
	public int countPaging_kid(Food_searchVo svo) {
		return mysqlSession.selectOne(namespace + ".listCount_kid", svo);
	}
	
	@Override
	public int countPaging(Food_searchVo svo) {
		return mysqlSession.selectOne(namespace + ".listCount", svo);
	}

	@Override
	public Food_dataVo detail_like(Integer fid) {
		return mysqlSession.selectOne(namespace + ".detail_like", fid);
	}

	@Override
	public List<Food_reservationVo> rstype() {
		return mysqlSession.selectList(namespace + ".rstype");
	}

	@Override
	public List<Food_reservationVo> rstime() {
		return mysqlSession.selectList(namespace + ".rstime");
	}

	@Override
	public void insertReservation(Food_reservationVo rvo) {
		mysqlSession.insert(namespace + ".insertReservation", rvo);
	}

	@Override
	public List<Food_reservationVo> reservationFood(Food_reservationVo rvo) {
		return mysqlSession.selectList(namespace + ".listReservation", rvo);
	}

	@Override
	public List<Food_reservationVo> reservationFoodTotal(Food_reservationVo rvo) {
		return mysqlSession.selectList(namespace + ".reservationTotal", rvo);
	}
}
