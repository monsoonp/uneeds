package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.movie.domain.MovieVO;
import com.movie.persistence.MovieDAO;

@Service
public class MovieServiceImpl implements MovieService{

	@Inject
	private MovieDAO dao;

	@Override
	public void insert_movie(MovieVO mvo) throws Exception {
		dao.insertMovie(mvo);
	}

	@Override
	public List<MovieVO> listall_movie() throws Exception {
		return dao.readMovie();
	}

	@Override
	public void delete_movie(MovieVO mvo) throws Exception {
		dao.deleteMovie(mvo);
	}

	@Override
	public int wgradecd_count(MovieVO mvo) throws Exception {
		return dao.wgradecd_count(mvo);
	}
}
