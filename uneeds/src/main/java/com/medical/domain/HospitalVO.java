package com.medical.domain;

public class HospitalVO {
	// 멤버변수
	private String hname;
	private String hurl;
	private String htel;
	private String haddr;
	
	public HospitalVO() {}
	public HospitalVO(String hname, String hurl, String htel, String haddr) {
		super();
		this.hname = hname;
		this.hurl = hurl;
		this.htel = htel;
		this.haddr = haddr;
	}
	
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHurl() {
		return hurl;
	}
	public void setHurl(String hurl) {
		this.hurl = hurl;
	}
	public String getHtel() {
		return htel;
	}
	public void setHtel(String htel) {
		this.htel = htel;
	}
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}
	@Override
	public String toString() {
		return "HospitalVO [hname=" + hname + ", hurl=" + hurl + ", htel=" + htel + ", haddr=" + haddr + "]";
	}
	
	
	
	

}
