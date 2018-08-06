
package com.movie.domain;

public class ViewTimetableVO {
	private int timetcd;
	private String tname;
	private String tnum;
	private String rtime;
	private int theatercd;
	
	public ViewTimetableVO() {}

	

	public ViewTimetableVO(int timetcd, String tname, String tnum, String rtime, int theatercd) {
		super();
		this.timetcd = timetcd;
		this.tname = tname;
		this.tnum = tnum;
		this.rtime = rtime;
		this.theatercd = theatercd;
	}



	public int getTimetcd() {
		return timetcd;
	}

	public void setTimetcd(int timetcd) {
		this.timetcd = timetcd;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public int getTheatercd() {
		return theatercd;
	}

	public void setTheatercd(int theatercd) {
		this.theatercd = theatercd;
	}

	@Override
	public String toString() {
		return "ViewTimetableVO [timetcd=" + timetcd + ", tname=" + tname + ", tnum=" + tnum + ", rtime=" + rtime
				+ ", theatercd=" + theatercd + "]";
	}
	
}
