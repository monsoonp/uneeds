package com.movie.domain;

//할인VO
public class DiscountVO {
	private int discountcd; //할인코드
	private String disname; //할인명
	private Double disrate; //할인율
	
	public DiscountVO() {}

	public DiscountVO(int discountcd, String disname, Double disrate) {
		super();
		this.discountcd = discountcd;
		this.disname = disname;
		this.disrate = disrate;
	}

	public int getDiscountcd() {
		return discountcd;
	}

	public void setDiscountcd(int discountcd) {
		this.discountcd = discountcd;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public Double getDisrate() {
		return disrate;
	}

	public void setDisrate(Double disrate) {
		this.disrate = disrate;
	}

	@Override
	public String toString() {
		return "DiscountVO [discountcd=" + discountcd + ", disname=" + disname + ", disrate=" + disrate + "]";
	}

}
