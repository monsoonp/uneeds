package com.movie.persistence;

import java.util.List;

import com.movie.domain.DiscountVO;

public interface DiscountDAO {
	//할인코드등록
	public void insertDiscount(DiscountVO dvo);
	//할인코드리스트
	public List<DiscountVO> readDiscount();
	//할인코드삭제
	public void deleteDiscount(DiscountVO dvo);
	//할인코드 할인율수정
	public void updateDiscount(DiscountVO dvo);
}
