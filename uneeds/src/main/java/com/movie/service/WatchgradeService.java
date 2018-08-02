package com.movie.service;

import java.util.List;

import com.movie.domain.WatchgradeVO;

//비지니스계층
public interface WatchgradeService {
	//관람등급 입력서비스
	public void insert_wgrade(WatchgradeVO wgvo) throws Exception;
	
	//관람등급 리스트구현
	public List<WatchgradeVO> listall_wgrade() throws Exception;
	
	//관람등급 삭제
	public void delete_wgrade(WatchgradeVO wgvo) throws Exception;
}
