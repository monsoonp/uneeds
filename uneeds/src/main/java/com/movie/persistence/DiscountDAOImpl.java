package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.DiscountVO;

@Repository //DAO스프링인식
public class DiscountDAOImpl implements DiscountDAO{
	
	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.DiscountMapper";
	
	//할인코드등록
	@Override
	public void insertDiscount(DiscountVO dvo) {
		mysqlSession.insert(mspace+".insertDiscount",dvo);
	}

	//할인코드리스트
	@Override
	public List<DiscountVO> readDiscount() {
		return mysqlSession.selectList(mspace+".listDiscount");
	}

	//할인코드삭제
	@Override
	public void deleteDiscount(DiscountVO dvo) {
		mysqlSession.delete(mspace+".deleteDiscount",dvo);
	}

	//할인코드 할인율 수정
	@Override
	public void updateDiscount(DiscountVO dvo) {
		mysqlSession.update(mspace+".updateDiscount",dvo);
	}

}
