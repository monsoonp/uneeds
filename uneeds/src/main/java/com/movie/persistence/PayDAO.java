package com.movie.persistence;

import java.util.List;

import com.movie.domain.PayVO;

public interface PayDAO {
	//결제코드등록
	public void insertPay(PayVO pvo);
	//결제코드리스트
	public List<PayVO> readPay();
	//결제코드삭제
	public void deletePay(PayVO pvo);
	//결제코드 할인율수정
	public void updatePay(PayVO pvo);
}
