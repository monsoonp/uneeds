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

}
