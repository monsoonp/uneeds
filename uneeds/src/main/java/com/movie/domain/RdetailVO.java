package com.movie.domain;

//예매상세
public class RdetailVO {
	private int redetailcd;
	private String rselectdate;
	private int tpeople;
	private String peoplecd;
	private int umoviecd;
	private int timetcd;
	private String seatcd;
	private int paycd;
	private int discountcd;
	private int statecd;
	
	public RdetailVO() {
	}
	




	public RdetailVO(int redetailcd, String rselectdate, int tpeople, String peoplecd, int umoviecd, int timetcd,
			String seatcd, int paycd, int discountcd, int statecd) {
		super();
		this.redetailcd = redetailcd;
		this.rselectdate = rselectdate;
		this.tpeople = tpeople;
		this.peoplecd = peoplecd;
		this.umoviecd = umoviecd;
		this.timetcd = timetcd;
		this.seatcd = seatcd;
		this.paycd = paycd;
		this.discountcd = discountcd;
		this.statecd = statecd;
	}





	public String getPeoplecd() {
		return peoplecd;
	}


	public void setPeoplecd(String peoplecd) {
		this.peoplecd = peoplecd;
	}

	
	public int getRedetailcd() {
		return redetailcd;
	}


	public void setRedetailcd(int redetailcd) {
		this.redetailcd = redetailcd;
	}



	public String getRselectdate() {
		return rselectdate;
	}





	public void setRselectdate(String rselectdate) {
		this.rselectdate = rselectdate;
	}





	public int getTpeople() {
		return tpeople;
	}
	public void setTpeople(int tpeople) {
		this.tpeople = tpeople;
	}
	public int getUmoviecd() {
		return umoviecd;
	}
	public void setUmoviecd(int umoviecd) {
		this.umoviecd = umoviecd;
	}
	public int getTimetcd() {
		return timetcd;
	}
	public void setTimetcd(int timetcd) {
		this.timetcd = timetcd;
	}
	public String getSeatcd() {
		return seatcd;
	}
	public void setSeatcd(String seatcd) {
		this.seatcd = seatcd;
	}
	public int getPaycd() {
		return paycd;
	}
	public void setPaycd(int paycd) {
		this.paycd = paycd;
	}
	public int getDiscountcd() {
		return discountcd;
	}
	public void setDiscountcd(int discountcd) {
		this.discountcd = discountcd;
	}
	public int getStatecd() {
		return statecd;
	}
	public void setStatecd(int statecd) {
		this.statecd = statecd;
	}





	@Override
	public String toString() {
		return "RdetailVO [redetailcd=" + redetailcd + ", rselectdate=" + rselectdate + ", tpeople=" + tpeople
				+ ", peoplecd=" + peoplecd + ", umoviecd=" + umoviecd + ", timetcd=" + timetcd + ", seatcd=" + seatcd
				+ ", paycd=" + paycd + ", discountcd=" + discountcd + ", statecd=" + statecd + "]";
	}




}
