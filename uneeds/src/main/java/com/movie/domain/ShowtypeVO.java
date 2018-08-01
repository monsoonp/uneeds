package com.movie.domain;

//상영형태VO
public class ShowtypeVO {
	
	private int showtycd; //상영형태코드
	private String showtyname; //상영형태
	
	//생성자
	public ShowtypeVO() {}
	
	public ShowtypeVO(int showtycd, String showtyname) {
		super();
		this.showtycd = showtycd;
		this.showtyname = showtyname;
	}

	//getter,setter
	public int getShowtycd() {
		return showtycd;
	}
	public void setShowtycd(int showtycd) {
		this.showtycd = showtycd;
	}
	public String getShowtyname() {
		return showtyname;
	}
	public void setShowtyname(String showtyname) {
		this.showtyname = showtyname;
	}

	@Override
	public String toString() {
		return "ShowtypeVO [showtycd=" + showtycd + ", showtyname=" + showtyname + "]";
	}
}
