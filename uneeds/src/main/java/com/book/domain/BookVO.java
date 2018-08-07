package com.book.domain;

import java.util.Date;

public class BookVO {
	
	//
	private int bcode;
	private int bisbn;
	private String btitle;
	private int acode;
	private int pcode;
	private String bimage;
	private int bprice;
	private int bdiscount;
	private Date bdate;
	private String bdesc;
	
	public BookVO() {
		super();
	}
	public BookVO(int bcode, int bisbn, String btitle, int acode, int pcode, String bimage, int bprice, int bdiscount,
			Date bdate, String bdesc) {
		super();
		this.bcode = bcode;
		this.bisbn = bisbn;
		this.btitle = btitle;
		this.acode = acode;
		this.pcode = pcode;
		this.bimage = bimage;
		this.bprice = bprice;
		this.bdiscount = bdiscount;
		this.bdate = bdate;
		this.bdesc = bdesc;
	}
	
	//
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getBisbn() {
		return bisbn;
	}
	public void setBisbn(int bisbn) {
		this.bisbn = bisbn;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getAcode() {
		return acode;
	}
	public void setAcode(int acode) {
		this.acode = acode;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	public int getBdiscount() {
		return bdiscount;
	}
	public void setBdiscount(int bdiscount) {
		this.bdiscount = bdiscount;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBdesc() {
		return bdesc;
	}
	public void setBdesc(String bdesc) {
		this.bdesc = bdesc;
	}
	
	//
	@Override
	public String toString() {
		return "BestsVO [bcode=" + bcode + ", bisbn=" + bisbn + ", btitle=" + btitle + ", acode=" + acode + ", pcode="
				+ pcode + ", bimage=" + bimage + ", bprice=" + bprice + ", bdiscount=" + bdiscount + ", bdate=" + bdate
				+ ", bdesc=" + bdesc + "]";
	}
	
	
	
}
