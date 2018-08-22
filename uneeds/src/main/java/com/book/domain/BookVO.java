package com.book.domain;

import java.util.Date;

public class BookVO {
	
	//
	private int bcode;
	private String bisbn;
	private String btitle;
	private int acode;
	private int pcode;
	private String bimage;
	private int bprice;
	private int bdiscount;
	private Date bdate;
	private String bdesc;
	private String aname;
	private String pname;
	
	public BookVO() {
		super();
	}
	public BookVO(int bcode, String bisbn, String btitle, int acode, int pcode, String bimage, int bprice,
			int bdiscount, Date bdate, String bdesc, String aname, String pname) {
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
		this.aname = aname;
		this.pname = pname;
	}

	//
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getBisbn() {
		return bisbn;
	}
	public void setBisbn(String bisbn) {
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
	
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	//
	@Override
	public String toString() {
		return "BookVO [bcode=" + bcode + ", bisbn=" + bisbn + ", btitle=" + btitle + ", acode=" + acode + ", pcode="
				+ pcode + ", bimage=" + bimage + ", bprice=" + bprice + ", bdiscount=" + bdiscount + ", bdate=" + bdate
				+ ", bdesc=" + bdesc + ", aname=" + aname + ", pname=" + pname + "]";
	}
	
	
	
}
