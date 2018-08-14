package com.movie.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.TimetableVO;
import com.movie.persistence.TimetableDAO;

@Service
public class TimetableServiceImpl implements TimetableService{

	@Inject
	private TimetableDAO dao;

	@Override
	public void insert_timetable(TimetableVO ttvo) throws Exception {
		dao.insertTimetable(ttvo);
	}

	@Override
	public void delete_timetable(TimetableVO ttvo) throws Exception {
		dao.deleteTimetable(ttvo);
	}

	@Override
	public int count_rtimecd(TimetableVO ttvo) throws Exception {
		return dao.countrtime(ttvo);
	}

	@Override
	public int theatercd_count(TimetableVO ttvo) throws Exception {
		return dao.theatercd_count(ttvo);
	}

	@Override
	public int tnumcd_count(TimetableVO ttvo) throws Exception {
		return dao.tnumcd_count(ttvo);
	}

	@Override
	public int allcd_count(TimetableVO ttvo) throws Exception {
		return dao.allcd_count(ttvo);
	}


}
