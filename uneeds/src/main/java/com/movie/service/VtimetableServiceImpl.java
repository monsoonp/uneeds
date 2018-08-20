package com.movie.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.domain.ViewTimetableVO;
import com.movie.persistence.VTimetableDAO;

@Service
public class VtimetableServiceImpl implements VTimetableService{

	@Inject
	private VTimetableDAO dao;

	@Override
	public List<ViewTimetableVO> listall_timetable() throws Exception {
		return dao.readVTimetable();
	}

	@Override
	public List<ViewTimetableVO> list_search_timetable(ViewTimetableVO vtvo) throws Exception {
		return dao.searchVTimetable(vtvo);
	}

	@Override
	public String reserv_tname(int timetcd) throws Exception {
		return dao.reserv_tname(timetcd);
	}
}
