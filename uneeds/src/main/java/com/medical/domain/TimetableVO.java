package com.medical.domain;

public class TimetableVO {
	// 멤버변수
	private int tcode;
	private String ttime;
	
	
	public TimetableVO() {}

	public TimetableVO(int tcode, String ttime) {
		super();
		this.tcode = tcode;
		this.ttime = ttime;
	}


	public int gettcode() {
		return tcode;
	}


	public void settcode(int tcode) {
		this.tcode = tcode;
	}


	public String getttime() {
		return ttime;
	}


	public void setttime(String ttime) {
		this.ttime = ttime;
	}

	@Override
	public String toString() {
		return "CheckListVO [tcode=" + tcode + ", ttime=" + ttime + "]";
	}
	
	
	

}
