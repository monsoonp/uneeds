package com.book.domain;

import java.io.Serializable;

public class PriceVO implements Serializable  {
	
	private static final long serialVersionUID = 1L;
	
	//
	private String new_price;
	private String used_price;
	private String e_price;
	private String url;
	
	//
	public PriceVO(String new_price, String used_price, String e_price, String url) {
		super();
		this.new_price = new_price;
		this.used_price = used_price;
		this.e_price = e_price;
		this.url = url;
	}
	public PriceVO() {
		super();
	}
	
	//
	public String getNew_price() {
		return new_price;
	}
	public void setNew_price(String new_price) {
		this.new_price = new_price;
	}
	public String getUsed_price() {
		return used_price;
	}
	public void setUsed_price(String used_price) {
		this.used_price = used_price;
	}
	public String getE_price() {
		return e_price;
	}
	public void setE_price(String e_price) {
		this.e_price = e_price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	//
	@Override
	public String toString() {
		return "PriceVO [new_price=" + new_price + ", used_price=" + used_price + ", e_price=" + e_price + ", url="
				+ url + "]";
	}
	
	
	
}
