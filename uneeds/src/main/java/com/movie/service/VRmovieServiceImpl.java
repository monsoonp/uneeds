package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.ViewRmovieVO;
import com.movie.persistence.VRmovieDAO;
@Service
public class VRmovieServiceImpl implements VRmovieService{

	@Inject
	private VRmovieDAO dao;

	@Override
	public List<ViewRmovieVO> listall_vrmovie() throws Exception {
		return dao.readVRmovie();
	}

}
