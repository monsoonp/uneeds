
package com.movie.domain;

public class View_TimetableVO {
	private int timetcd;
	private String tname;
	private String tnum;
	private String rtime;
	
	public View_TimetableVO() {}

	public View_TimetableVO(int timetcd, String tname, String tnum, String rtime) {
		super();
		this.timetcd = timetcd;
		this.tname = tname;
		this.tnum = tnum;
		this.rtime = rtime;
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

	@Override
	public String toString() {
		return "View_TimetableVO [timetcd=" + timetcd + ", tname=" + tname + ", tnum=" + tnum + ", rtime=" + rtime
				+ "]";
	}
}
