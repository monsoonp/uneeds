package com.movie.domain;

public class TimetableVO {
	private int timetcd; //시간표코드
	private int theatercd;//지점코드
	private int tnumcd;//상영관코드
	private int rtimecd;//예매시간코드
	
	public TimetableVO() {}

	public TimetableVO(int timetcd, int theatercd, int tnumcd, int rtimecd) {
		super();
		this.timetcd = timetcd;
		this.theatercd = theatercd;
		this.tnumcd = tnumcd;
		this.rtimecd = rtimecd;
	}

	public int getTimetcd() {
		return timetcd;
	}

	public void setTimetcd(int timetcd) {
		this.timetcd = timetcd;
	}

	public int getTheatercd() {
		return theatercd;
	}

	public void setTheatercd(int theatercd) {
		this.theatercd = theatercd;
	}

	public int getTnumcd() {
		return tnumcd;
	}

	public void setTnumcd(int tnumcd) {
		this.tnumcd = tnumcd;
	}

	public int getRtimecd() {
		return rtimecd;
	}

	public void setRtimecd(int rtimecd) {
		this.rtimecd = rtimecd;
	}

	@Override
	public String toString() {
		return "TimetableVO [timetcd=" + timetcd + ", theatercd=" + theatercd + ", tnumcd=" + tnumcd + ", rtimecd="
				+ rtimecd + "]";
	}
	
}
