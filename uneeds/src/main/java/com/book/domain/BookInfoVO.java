package com.book.domain;

import java.util.Date;

public class BookInfoVO {
	
	//
	private int isbn;
	private String title;
	private String author;
	private String pub;
	private String img;
	private int price;
	private int discount;
	private int disRate;
	private Date date;
	private String desc;
	private String link;
	
	//
	public BookInfoVO() {
		super();
	}
	public BookInfoVO(int isbn, String title, String author, String pub, String img, int price, int discount,
			int disRate, Date date, String desc, String link) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.author = author;
		this.pub = pub;
		this.img = img;
		this.price = price;
		this.discount = discount;
		this.disRate = disRate;
		this.date = date;
		this.desc = desc;
		this.link = link;
	}


	//
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	
	//
	@Override
	public String toString() {
		return "BookInfoVO [isbn=" + isbn + ", title=" + title + ", author=" + author + ", pub=" + pub + ", img=" + img
				+ ", price=" + price + ", discount=" + discount + ", disRate=" + disRate + ", date=" + date + ", desc="
				+ desc + ", link=" + link + "]";
	}
	
}
