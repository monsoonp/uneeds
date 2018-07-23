package com.main.domain;

public class uMemberVO {
	//
	int mcode;	
	int lcode;	
	String mid;	
	String pw;	
	String unik; 
	String udate;
	
	//
	public uMemberVO(int mcode, int lcode, String mid, String pw, String unik, String udate) {
		super();
		this.mcode = mcode;
		this.lcode = lcode;
		this.mid = mid;
		this.pw = pw;
		this.unik = unik;
		this.udate = udate;
	}
	public uMemberVO() {
		super();
	}
	
	//
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public int getLcode() {
		return lcode;
	}
	public void setLcode(int lcode) {
		this.lcode = lcode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUnik() {
		return unik;
	}
	public void setUnik(String unik) {
		this.unik = unik;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	
	//
	@Override
	public String toString() {
		return "uMemberVO [mcode=" + mcode + ", lcode=" + lcode + ", mid=" + mid + ", pw=" + pw + ", unik=" + unik
				+ ", udate=" + udate + "]";
	}
	
	
	
	
	
	
	
}
