package com.movie.domain;

//영화관지점VO
public class TheaterVO {
	
	private int theatercd;//지점코드
	private String tname;//지점명
	private String taddr;//주소
	
	public TheaterVO() {}

	public TheaterVO(int theatercd, String tname, String taddr) {
		super();
		this.theatercd = theatercd;
		this.tname = tname;
		this.taddr = taddr;
	}

	public int getTheatercd() {
		return theatercd;
	}

	public void setTheatercd(int theatercd) {
		this.theatercd = theatercd;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTaddr() {
		return taddr;
	}

	public void setTaddr(String taddr) {
		this.taddr = taddr;
	}

	@Override
	public String toString() {
		return "TheaterVO [theatercd=" + theatercd + ", tname=" + tname + ", taddr=" + taddr + "]";
	}

}
