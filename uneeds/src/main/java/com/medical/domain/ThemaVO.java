package com.medical.domain;

public class ThemaVO {
	// 멤버변수
	private String mtnumber;
	private String mtname;
	
	
	public ThemaVO() {}
	
	public ThemaVO(String mtnumber, String mtname) {
		super();
		this.mtnumber = mtnumber;
		this.mtname = mtname;
	}

	public String getmtnumber() {
		return mtnumber;
	}

	public void setmtnumber(String mtnumber) {
		this.mtnumber = mtnumber;
	}

	public String getmtname() {
		return mtname;
	}

	public void setmtname(String mtname) {
		this.mtname = mtname;
	}

	@Override
	public String toString() {
		return "KindsVO [mtnumber=" + mtnumber + ", mtname=" + mtname + "]";
	}

	

}
