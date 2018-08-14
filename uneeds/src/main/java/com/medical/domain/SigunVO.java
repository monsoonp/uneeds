package com.medical.domain;

public class SigunVO {
	// 멤버변수
	private int guncode;
	private String gunname;
	
	
	public SigunVO() {}
	
	public SigunVO(int guncode, String gunname) {
		super();
		this.guncode = guncode;
		this.gunname = gunname;
	}

	public int getguncode() {
		return guncode;
	}

	public void setguncode(int guncode) {
		this.guncode = guncode;
	}

	public String getgunname() {
		return gunname;
	}

	public void setgunname(String gunname) {
		this.gunname = gunname;
	}

	@Override
	public String toString() {
		return "SidoVO [guncode=" + guncode + ", gunname=" + gunname + "]";
	}

	

}
