package com.movie.domain;

import java.util.Date;

//예매
public class ReservVO {
	private int reservcd;
	private int mcode;
	private int redetailcd;
	private Date reserdate;

	public ReservVO() {
	}

	public ReservVO(int reservcd, int mcode, int redetailcd, Date reserdate) {
		super();
		this.reservcd = reservcd;
		this.mcode = mcode;
		this.redetailcd = redetailcd;
		this.reserdate = reserdate;
	}

	public int getReservcd() {
		return reservcd;
	}

	public void setReservcd(int reservcd) {
		this.reservcd = reservcd;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public int getRedetailcd() {
		return redetailcd;
	}

	public void setRedetailcd(int redetailcd) {
		this.redetailcd = redetailcd;
	}

	public Date getReserdate() {
		return reserdate;
	}

	public void setReserdate(Date reserdate) {
		this.reserdate = reserdate;
	}

	@Override
	public String toString() {
		return "ReservVO [reservcd=" + reservcd + ", mcode=" + mcode + ", redetailcd=" + redetailcd + ", reserdate="
				+ reserdate + "]";
	}

}
