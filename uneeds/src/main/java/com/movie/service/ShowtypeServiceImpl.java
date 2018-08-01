package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.ShowtypeVO;
import com.movie.persistence.ShowtypeDAO;
@Service
public class ShowtypeServiceImpl implements ShowtypeService{

	@Inject
	private ShowtypeDAO dao;

	@Override
	public void insert_showtype(ShowtypeVO stvo) throws Exception {
		dao.insertShowtype(stvo);
	}

	@Override
	public List<ShowtypeVO> listall_showtype() throws Exception {
		return dao.readShowtype();
	}

	@Override
	public void delete_showtype(ShowtypeVO stvo) throws Exception {
		dao.deleteShowtype(stvo);
	}
	
}
