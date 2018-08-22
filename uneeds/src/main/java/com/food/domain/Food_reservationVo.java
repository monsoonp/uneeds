package com.food.domain;

public class Food_reservationVo {
	private int fid, tid, tmid, rsperson, mcode, rsid;
	private String rsname, rsphone, rsdate, tlist, tmlist, fname;
	
	public Food_reservationVo() {}

	public Food_reservationVo(int fid, int tid, int tmid, int rsperson, int mcode, int rsid, String rsname,
			String rsphone, String rsdate, String tlist, String tmlist, String fname) {
		super();
		this.fid = fid;
		this.tid = tid;
		this.tmid = tmid;
		this.rsperson = rsperson;
		this.mcode = mcode;
		this.rsid = rsid;
		this.rsname = rsname;
		this.rsphone = rsphone;
		this.rsdate = rsdate;
		this.tlist = tlist;
		this.tmlist = tmlist;
		this.fname = fname;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
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

	public int getRsperson() {
		return rsperson;
	}

	public void setRsperson(int rsperson) {
		this.rsperson = rsperson;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public int getRsid() {
		return rsid;
	}

	public void setRsid(int rsid) {
		this.rsid = rsid;
	}

	public String getRsname() {
		return rsname;
	}

	public void setRsname(String rsname) {
		this.rsname = rsname;
	}

	public String getRsphone() {
		return rsphone;
	}

	public void setRsphone(String rsphone) {
		this.rsphone = rsphone;
	}

	public String getRsdate() {
		return rsdate;
	}

	public void setRsdate(String rsdate) {
		this.rsdate = rsdate;
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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}
