package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.ReleaseVO;
import com.movie.persistence.ReleaseDAO;

@Service
public class ReleaseServiceImpl implements ReleaseService{

	@Inject
	private ReleaseDAO dao;

	@Override
	public void insert_release(ReleaseVO rvo) throws Exception {
		dao.insertRelease(rvo);
	}

	@Override
	public List<ReleaseVO> listall_release() throws Exception {
		return dao.readRelease();
	}

	@Override
	public void delete_release(ReleaseVO rvo) throws Exception {
		dao.deleteRelease(rvo);
	}

	@Override
	public int showtycd_count(ReleaseVO rvo) throws Exception {
		return dao.showtycd_count(rvo);
	}

	@Override
	public int moviecd_count(ReleaseVO rvo) throws Exception {
		return dao.moviecd_count(rvo);
	}

	@Override
	public int releaseall_count(ReleaseVO rvo) throws Exception {
		return dao.releaseall_count(rvo);
	}
	
}
