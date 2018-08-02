package com.movie.domain;

public class TnumVO {
	private int tnumcd; //상영관코드
	private String tnum;//상영관상세
	
	public TnumVO() {}

	public TnumVO(int tnumcd, String tnum) {
		super();
		this.tnumcd = tnumcd;
		this.tnum = tnum;
	}

	public int getTnumcd() {
		return tnumcd;
	}

	public void setTnumcd(int tnumcd) {
		this.tnumcd = tnumcd;
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	@Override
	public String toString() {
		return "TnumVO [tnumcd=" + tnumcd + ", tnum=" + tnum + "]";
	}
}
