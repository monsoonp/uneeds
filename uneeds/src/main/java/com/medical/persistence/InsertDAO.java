package com.medical.persistence;



import com.medical.domain.KindsVO;
import com.medical.domain.SidoVO;
import com.medical.domain.SigunVO;
import com.medical.domain.ThemaVO;

public interface InsertDAO {
	
	public void insertSido(SidoVO vo) throws Exception;
	public void insertSigun(SigunVO vvo) throws Exception;
	public void insertKinds(KindsVO ko) throws Exception;
	public void insertThema(ThemaVO to) throws Exception;
	
	
}
