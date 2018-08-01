package com.exhibition.domain;

import java.util.Date;

public class ReservationVO {
	private Integer reservatioNum;
	private int mcode;
	private int seq;
	private int pcode;
	private Date exhiDate;
	private int resNumber;
	private Date resDate;
	
	public ReservationVO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationVO(Integer reservatioNum, int mcode, int seq, int pcode, Date exhiDate, int resNumber,
			Date resDate) {
		super();
		this.reservatioNum = reservatioNum;
		this.mcode = mcode;
		this.seq = seq;
		this.pcode = pcode;
		this.exhiDate = exhiDate;
		this.resNumber = resNumber;
		this.resDate = resDate;
	}

	public Integer getReservatioNum() {
		return reservatioNum;
	}

	public void setReservatioNum(Integer reservatioNum) {
		this.reservatioNum = reservatioNum;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public Date getExhiDate() {
		return exhiDate;
	}

	public void setExhiDate(Date exhiDate) {
		this.exhiDate = exhiDate;
	}

	public int getResNumber() {
		return resNumber;
	}

	public void setResNumber(int resNumber) {
		this.resNumber = resNumber;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	@Override
	public String toString() {
		return "ReservationVO [reservatioNum=" + reservatioNum + ", mcode=" + mcode + ", seq=" + seq + ", pcode="
				+ pcode + ", exhiDate=" + exhiDate + ", resNumber=" + resNumber + ", resDate=" + resDate + "]";
	}
	
	

}
