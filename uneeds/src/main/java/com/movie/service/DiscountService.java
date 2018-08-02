package com.movie.service;

import java.util.List;

import com.movie.domain.DiscountVO;

//비지니스계층 인터페이스
public interface DiscountService {
	//할인코드 입력서비스
	public void insert_discount(DiscountVO dvo) throws Exception;
	
	//할인코드 리스트구현
	public List<DiscountVO> listall_discount() throws Exception;
	
	//할인코드 삭제
	public void delete_discount(DiscountVO dvo) throws Exception;
	
	//할인코드 할인율 수정
	public void update_discount(DiscountVO dvo) throws Exception;
}
