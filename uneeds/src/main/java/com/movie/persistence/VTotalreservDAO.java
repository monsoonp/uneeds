package com.movie.persistence;

import java.util.List;

import com.movie.domain.ViewTotalreservVO;

public interface VTotalreservDAO {
	//어드민 예매현황상세
	public List<ViewTotalreservVO> listVTotalreserv_admin();
	
}
