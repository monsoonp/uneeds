package com.movie.persistence;

import java.util.List;

import com.movie.domain.WatchgradeVO;

public interface WatchgradeDAO {
	//관람등급입력
	public void insertWatchgrade(WatchgradeVO wgvo);
	
	//관람등급전체읽어오기
	public List<WatchgradeVO> readWatchgrade();
	
	//관람등급코드삭제
	public void deleteWatchgrade(WatchgradeVO wgvo);
}
