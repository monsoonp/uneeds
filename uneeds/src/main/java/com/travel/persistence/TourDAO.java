package com.travel.persistence;

import java.util.List;

import com.travel.model.BookMarkVO;
import com.travel.model.ReviewVO;
import com.travel.model.TravelareainfoVO;

public interface TourDAO {
	public void insertTravelApiList(TravelareainfoVO vo);
	
	// BookMark (즐겨찾기용) 값 insert
	public void bookmarkinsertinfo(BookMarkVO vo);
	
	// review (리뷰) 값 insert
	public void reviewinsertinfo(ReviewVO vo);
	
	// review 값 불러오기(select)
	public List<ReviewVO> reviewselectinfo(String contentid);
}
