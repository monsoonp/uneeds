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

	@Override
	public List<ViewRmovieVO> user_listall_vrmovie() throws Exception {
		return dao.user_readVRmovie();
	}

	@Override
	public List<ViewRmovieVO> reserv_movietype(int umoviecd) throws Exception {
		return dao.reserv_movietype(umoviecd);
	}

}
