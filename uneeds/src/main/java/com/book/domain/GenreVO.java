package com.book.domain;

public class GenreVO {
	
	//
	private int sgcode;
	private int bscode;
	private String sgcate;
	private String sgname;
	
	//
	public GenreVO() {
		super();
	}
	public GenreVO(int sgcode, int bscode, String sgcate, String sgname) {
		super();
		this.sgcode = sgcode;
		this.bscode = bscode;
		this.sgcate = sgcate;
		this.sgname = sgname;
	}
	
	//
	public int getSgcode() {
		return sgcode;
	}
	public void setSgcode(int sgcode) {
		this.sgcode = sgcode;
	}
	public int getBscode() {
		return bscode;
	}
	public void setBscode(int bscode) {
		this.bscode = bscode;
	}
	public String getSgcate() {
		return sgcate;
	}
	public void setSgcate(String sgcate) {
		this.sgcate = sgcate;
	}
	public String getSgname() {
		return sgname;
	}
	public void setSgname(String sgname) {
		this.sgname = sgname;
	}
	
	//
	@Override
	public String toString() {
		return "GenreVO [sgcode=" + sgcode + ", bscode=" + bscode + ", sgcate=" + sgcate + ", sgname=" + sgname + "]";
	}
	
		
}
