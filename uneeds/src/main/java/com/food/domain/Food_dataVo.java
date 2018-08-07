package com.food.domain;

public class Food_dataVo {
	private int fid, kid, lid, flike;
	private String fname, fdetail, faddr, fphone, fgmenu, fimg1, fimg2, fimg3, kname;
	
	public Food_dataVo() {}

	public Food_dataVo(int fid, int kid, int lid, int flike, String fname, String fdetail, String faddr, String fphone,
			String fgmenu, String fimg1, String fimg2, String fimg3, String kname) {
		super();
		this.fid = fid;
		this.kid = kid;
		this.lid = lid;
		this.flike = flike;
		this.fname = fname;
		this.fdetail = fdetail;
		this.faddr = faddr;
		this.fphone = fphone;
		this.fgmenu = fgmenu;
		this.fimg1 = fimg1;
		this.fimg2 = fimg2;
		this.fimg3 = fimg3;
		this.kname = kname;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getFlike() {
		return flike;
	}

	public void setFlike(int flike) {
		this.flike = flike;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFdetail() {
		return fdetail;
	}

	public void setFdetail(String fdetail) {
		this.fdetail = fdetail;
	}

	public String getFaddr() {
		return faddr;
	}

	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}

	public String getFphone() {
		return fphone;
	}

	public void setFphone(String fphone) {
		this.fphone = fphone;
	}

	public String getFgmenu() {
		return fgmenu;
	}

	public void setFgmenu(String fgmenu) {
		this.fgmenu = fgmenu;
	}

	public String getFimg1() {
		return fimg1;
	}

	public void setFimg1(String fimg1) {
		this.fimg1 = fimg1;
	}

	public String getFimg2() {
		return fimg2;
	}

	public void setFimg2(String fimg2) {
		this.fimg2 = fimg2;
	}

	public String getFimg3() {
		return fimg3;
	}

	public void setFimg3(String fimg3) {
		this.fimg3 = fimg3;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}
}
