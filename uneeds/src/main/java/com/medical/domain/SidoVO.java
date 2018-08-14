package com.medical.domain;

public class SidoVO {
	// 멤버변수
	private int sicode;
	private String siname;
	
	
	public SidoVO() {}
	
	public SidoVO(int code, String palce) {
		super();
		this.sicode = code;
		this.siname = palce;
	}

	public int getSicode() {
		return sicode;
	}

	public void setSicode(int sicode) {
		this.sicode = sicode;
	}

	public String getSiname() {
		return siname;
	}

	public void setSiname(String siname) {
		this.siname = siname;
	}

	@Override
	public String toString() {
		return "SidoVO [sicode=" + sicode + ", siname=" + siname + "]";
	}

	

}
