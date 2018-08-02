package com.movie.domain;

//예매상태 VO
public class RstateVO {
	private int statecd; //상태코드
	private String sname; //상태
	
	public RstateVO() {}

	public RstateVO(int statecd, String sname) {
		super();
		this.statecd = statecd;
		this.sname = sname;
	}

	public int getStatecd() {
		return statecd;
	}

	public void setStatecd(int statecd) {
		this.statecd = statecd;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	@Override
	public String toString() {
		return "RstateVO [statecd=" + statecd + ", sname=" + sname + "]";
	}
}
