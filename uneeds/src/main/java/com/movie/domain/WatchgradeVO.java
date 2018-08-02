package com.movie.domain;

//관람등급VO
public class WatchgradeVO {
	private int wgradecd; //관람등급코드
	private String wgradename;//관람등급
	
	public WatchgradeVO() {
	}

	public WatchgradeVO(int wgradecd, String wgradename) {
		super();
		this.wgradecd = wgradecd;
		this.wgradename = wgradename;
	}

	public int getWgradecd() {
		return wgradecd;
	}

	public void setWgradecd(int wgradecd) {
		this.wgradecd = wgradecd;
	}

	public String getWgradename() {
		return wgradename;
	}

	public void setWgradename(String wgradename) {
		this.wgradename = wgradename;
	}

	@Override
	public String toString() {
		return "WatchgradeVO [wgradecd=" + wgradecd + ", wgradename=" + wgradename + "]";
	}
	
	
}
