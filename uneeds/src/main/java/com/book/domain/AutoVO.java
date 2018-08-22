package com.book.domain;

public class AutoVO {
	
	//
	private String result;
	private String btitle;
	private String aname;
	private String pname;
	
	//
	public AutoVO() {
		super();
	}
	public AutoVO(String result, String btitle, String aname, String pname) {
		super();
		this.result = result;
		this.btitle = btitle;
		this.aname = aname;
		this.pname = pname;
	}
	
	//
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
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
		return "AutoVO [result=" + result + ", btitle=" + btitle + ", aname=" + aname + ", pname=" + pname + "]";
	}
	
	
	
}
