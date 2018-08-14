package com.medical.domain;

public class CheckListVO {
	// 멤버변수
	private int ctcode;
	private String ctmemo;
	
	
	public CheckListVO() {}

	public CheckListVO(int ctcode, String ctmemo) {
		super();
		this.ctcode = ctcode;
		this.ctmemo = ctmemo;
	}


	public int getCtcode() {
		return ctcode;
	}


	public void setCtcode(int ctcode) {
		this.ctcode = ctcode;
	}


	public String getCtmemo() {
		return ctmemo;
	}


	public void setCtmemo(String ctmemo) {
		this.ctmemo = ctmemo;
	}

	@Override
	public String toString() {
		return "CheckListVO [ctcode=" + ctcode + ", ctmemo=" + ctmemo + "]";
	}
	
	
	

}
