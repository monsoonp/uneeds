package com.movie.service;

import java.util.List;

import com.movie.domain.PayVO;

//비지니스계층 인터페이스
public interface PayService {
	//결제코드 입력서비스
	public void insert_pay(PayVO pvo) throws Exception;
	
	//결제코드 리스트구현
	public List<PayVO> listall_pay() throws Exception;
	
	//결제코드 삭제
	public void delete_pay(PayVO pvo) throws Exception;
	
	//결제코드 할인율 수정
	public void update_pay(PayVO pvo) throws Exception;
}
