package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.movie.domain.ViewTotalreservVO;
import com.movie.persistence.VTotalreservDAO;

@Service
public class VTotalreservServiceImpl implements VTotalreservService{

	@Inject
	private VTotalreservDAO dao;

	@Override
	public List<ViewTotalreservVO> listVTotalreserv_admin() throws Exception {
		return dao.listVTotalreserv_admin();
	}

}
