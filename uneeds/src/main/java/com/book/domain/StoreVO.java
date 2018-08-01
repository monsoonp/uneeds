package com.book.domain;

public class StoreVO {
	//
	private int bscode;
	private String bscate;
	private String bsname;
	private boolean bsonline;
	private boolean bsused;
	
	private String bstel;
	private String bsdesc;
	private String bsaddr;
	private String bsroadaddr;
	
	private int bslat;
	private int bslng;
	
	//
	public StoreVO() {
		super();
	}
	public StoreVO(int bscode, String bscate, String bsname, boolean bsonline, boolean bsused, String bstel,
			String bsdesc, String bsaddr, String bsroadaddr, int bslat, int bslng) {
		super();
		this.bscode = bscode;
		this.bscate = bscate;
		this.bsname = bsname;
		this.bsonline = bsonline;
		this.bsused = bsused;
		this.bstel = bstel;
		this.bsdesc = bsdesc;
		this.bsaddr = bsaddr;
		this.bsroadaddr = bsroadaddr;
		this.bslat = bslat;
		this.bslng = bslng;
	}
	
	//
	public int getBscode() {
		return bscode;
	}
	public void setBscode(int bscode) {
		this.bscode = bscode;
	}
	public String getBscate() {
		return bscate;
	}
	public void setBscate(String bscate) {
		this.bscate = bscate;
	}
	public String getBsname() {
		return bsname;
	}
	public void setBsname(String bsname) {
		this.bsname = bsname;
	}
	public boolean isBsonline() {
		return bsonline;
	}
	public void setBsonline(boolean bsonline) {
		this.bsonline = bsonline;
	}
	public boolean isBsused() {
		return bsused;
	}
	public void setBsused(boolean bsused) {
		this.bsused = bsused;
	}
	public String getBstel() {
		return bstel;
	}
	public void setBstel(String bstel) {
		this.bstel = bstel;
	}
	public String getBsdesc() {
		return bsdesc;
	}
	public void setBsdesc(String bsdesc) {
		this.bsdesc = bsdesc;
	}
	public String getBsaddr() {
		return bsaddr;
	}
	public void setBsaddr(String bsaddr) {
		this.bsaddr = bsaddr;
	}
	public String getBsroadaddr() {
		return bsroadaddr;
	}
	public void setBsroadaddr(String bsroadaddr) {
		this.bsroadaddr = bsroadaddr;
	}
	public int getBslat() {
		return bslat;
	}
	public void setBslat(int bslat) {
		this.bslat = bslat;
	}
	public int getBslng() {
		return bslng;
	}
	public void setBslng(int bslng) {
		this.bslng = bslng;
	}
	
	//
	@Override
	public String toString() {
		return "StoreVO [bscode=" + bscode + ", bscate=" + bscate + ", bsname=" + bsname + ", bsonline=" + bsonline
				+ ", bsused=" + bsused + ", bstel=" + bstel + ", bsdesc=" + bsdesc + ", bsaddr=" + bsaddr
				+ ", bsroadaddr=" + bsroadaddr + ", bslat=" + bslat + ", bslng=" + bslng + "]";
	}
	
	
	
	
	
	
}
