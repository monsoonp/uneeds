package com.movie.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.domain.PayVO;

@Repository //DAO스프링인식
public class PayDAOImpl implements PayDAO{

	@Inject
	private SqlSession mysqlSession;
	
	private static final String mspace="com.movie.mapper.PayMapper";

	//결제코드등록
	@Override
	public void insertPay(PayVO pvo) {
		mysqlSession.insert(mspace+".insertPay",pvo);
	}
	//결제코드리스트
	@Override
	public List<PayVO> readPay() {
		return mysqlSession.selectList(mspace+".listPay");
	}
	//결제코드삭제
	@Override
	public void deletePay(PayVO pvo) {
		mysqlSession.delete(mspace+".deletePay",pvo);
	}
	
	//결제코드 할인율 수정
	@Override
	public void updatePay(PayVO pvo) {
		mysqlSession.update(mspace+".updatePay",pvo);
	}
	
}
