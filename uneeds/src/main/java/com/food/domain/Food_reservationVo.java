package com.food.domain;

public class Food_reservationVo {
	private int tid, tmid;
	private String tlist, tmlist;
	
	public Food_reservationVo() {}

	public Food_reservationVo(int tid, int tmid, String tlist, String tmlist) {
		super();
		this.tid = tid;
		this.tmid = tmid;
		this.tlist = tlist;
		this.tmlist = tmlist;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getTmid() {
		return tmid;
	}

	public void setTmid(int tmid) {
		this.tmid = tmid;
	}

	public String getTlist() {
		return tlist;
	}

	public void setTlist(String tlist) {
		this.tlist = tlist;
	}

	public String getTmlist() {
		return tmlist;
	}

	public void setTmlist(String tmlist) {
		this.tmlist = tmlist;
	}

}
