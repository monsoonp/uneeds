package com.movie.domain;

//예매시간VO
public class RtimeVO {
	private int rtimecd;//예매시간코드
	private String rtime;//예매시간
	
	public RtimeVO() {}

	
	public RtimeVO(int rtimecd, String rtime) {
		super();
		this.rtimecd = rtimecd;
		this.rtime = rtime;
	}

	public int getRtimecd() {
		return rtimecd;
	}

	public void setRtimecd(int rtimecd) {
		this.rtimecd = rtimecd;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}


	@Override
	public String toString() {
		return "RtimeVO [rtimecd=" + rtimecd + ", rtime=" + rtime + "]";
	}

}
