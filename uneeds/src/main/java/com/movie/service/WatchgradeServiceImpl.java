package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.WatchgradeVO;
import com.movie.persistence.WatchgradeDAO;

@Service
public class WatchgradeServiceImpl implements WatchgradeService{

	@Inject
	private WatchgradeDAO dao;
	
	@Override
	public void insert_wgrade(WatchgradeVO wgvo) throws Exception {
		dao.insertWatchgrade(wgvo);
	}

	@Override
	public List<WatchgradeVO> listall_wgrade() throws Exception {
		return dao.readWatchgrade();
	}

	@Override
	public void delete_wgrade(WatchgradeVO wgvo) throws Exception {
		dao.deleteWatchgrade(wgvo);
	}
	
}
