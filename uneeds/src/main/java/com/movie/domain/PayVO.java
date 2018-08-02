package com.movie.domain;

//결제VO
public class PayVO {
	private int paycd;//결제코드
	private String payname;//결제명
	private Double paydrate;//이벤트할인율
	
	public PayVO() {}

	public PayVO(int paycd, String payname, Double paydrate) {
		super();
		this.paycd = paycd;
		this.payname = payname;
		this.paydrate = paydrate;
	}

	public int getPaycd() {
		return paycd;
	}

	public void setPaycd(int paycd) {
		this.paycd = paycd;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	public Double getPaydrate() {
		return paydrate;
	}

	public void setPaydrate(Double paydrate) {
		this.paydrate = paydrate;
	}

	@Override
	public String toString() {
		return "PayVO [paycd=" + paycd + ", payname=" + payname + ", paydrate=" + paydrate + "]";
	}

}
