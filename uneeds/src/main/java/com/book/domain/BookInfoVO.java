package com.book.domain;

import java.io.Serializable;

public class BookInfoVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//
	private String title;
	private String author;
	private String pub;
	private String img;
	
	private String isbn;
	private String date;
	
	private int price;
	private int discount;
	private int disRate;
	private String desc;
	private String link;
	private String star;
	
	//
	public BookInfoVO() {
		super();
	}
	public BookInfoVO(String title, String author, String pub, String img, String isbn, String date, int price,
			int discount, int disRate, String desc, String link, String star) {
		super();
		this.title = title;
		this.author = author;
		this.pub = pub;
		this.img = img;
		this.isbn = isbn;
		this.date = date;
		this.price = price;
		this.discount = discount;
		this.disRate = disRate;
		this.desc = desc;
		this.link = link;
		this.star = star;
	}
	
	//
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPub() {
		return pub;
	}
	public void setPub(String pub) {
		this.pub = pub;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDisRate() {
		return disRate;
	}
	public void setDisRate(int disRate) {
		this.disRate = disRate;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	
	@Override
	public String toString() {
		return "BookInfoVO [title=" + title + ", author=" + author + ", pub=" + pub + ", img=" + img + ", isbn=" + isbn
				+ ", date=" + date + ", price=" + price + ", discount=" + discount + ", disRate=" + disRate + ", desc="
				+ desc + ", link=" + link + ", star=" + star + "]";
	}
		
	
	
}
