package com.medical.domain;

public class MedicalVO {
	// 멤버변수
	private int num;
	private String addr; //주소
	private String name; //약국 이름 
	private String maping; //약국 위치 설명
	private String number; //전화번호
	private int ms_time; //월요일 오픈 시간
	private int mc_time; //월요일 클로즈 시간
	private int ts_time;
	private int tc_time;
	private int ws_time;
	private int wc_time;
	private int ths_time;
	private int thc_time;
	private int fs_time;
	private int fc_time;
	private String ss_time;
	private String sc_time;
	private String medicalid; //기관 아이디
	private double map_x;
	private double map_y;
	
	public MedicalVO() {}
	
	public MedicalVO(int num, String addr, String name, String maping, String number, int ms_time, int mc_time,
			int ts_time, int tc_time, int ws_time, int wc_time, int ths_time, int thc_time, int fs_time, int fc_time,
			String ss_time, String sc_time, String medicalid, double map_x, double map_y) {
		super();
		this.num = num;
		this.addr = addr;
		this.name = name;
		this.maping = maping;
		this.number = number;
		this.ms_time = ms_time;
		this.mc_time = mc_time;
		this.ts_time = ts_time;
		this.tc_time = tc_time;
		this.ws_time = ws_time;
		this.wc_time = wc_time;
		this.ths_time = ths_time;
		this.thc_time = thc_time;
		this.fs_time = fs_time;
		this.fc_time = fc_time;
		this.ss_time = ss_time;
		this.sc_time = sc_time;
		this.medicalid = medicalid;
		this.map_x = map_x;
		this.map_y = map_y;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaping() {
		return maping;
	}

	public void setMaping(String maping) {
		this.maping = maping;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public int getMs_time() {
		return ms_time;
	}

	public void setMs_time(int ms_time) {
		this.ms_time = ms_time;
	}

	public int getMc_time() {
		return mc_time;
	}

	public void setMc_time(int mc_time) {
		this.mc_time = mc_time;
	}

	public int getTs_time() {
		return ts_time;
	}

	public void setTs_time(int ts_time) {
		this.ts_time = ts_time;
	}

	public int getTc_time() {
		return tc_time;
	}

	public void setTc_time(int tc_time) {
		this.tc_time = tc_time;
	}

	public int getWs_time() {
		return ws_time;
	}

	public void setWs_time(int ws_time) {
		this.ws_time = ws_time;
	}

	public int getWc_time() {
		return wc_time;
	}

	public void setWc_time(int wc_time) {
		this.wc_time = wc_time;
	}

	public int getThs_time() {
		return ths_time;
	}

	public void setThs_time(int ths_time) {
		this.ths_time = ths_time;
	}

	public int getThc_time() {
		return thc_time;
	}

	public void setThc_time(int thc_time) {
		this.thc_time = thc_time;
	}

	public int getFs_time() {
		return fs_time;
	}

	public void setFs_time(int fs_time) {
		this.fs_time = fs_time;
	}

	public int getFc_time() {
		return fc_time;
	}

	public void setFc_time(int fc_time) {
		this.fc_time = fc_time;
	}

	public String getSs_time() {
		return ss_time;
	}

	public void setSs_time(String ss_time) {
		this.ss_time = ss_time;
	}

	public String getSc_time() {
		return sc_time;
	}

	public void setSc_time(String sc_time) {
		this.sc_time = sc_time;
	}

	public String getMedicalid() {
		return medicalid;
	}

	public void setMedicalid(String medicalid) {
		this.medicalid = medicalid;
	}

	public double getMap_x() {
		return map_x;
	}

	public void setMap_x(double map_x) {
		this.map_x = map_x;
	}

	public double getMap_y() {
		return map_y;
	}

	public void setMap_y(double map_y) {
		this.map_y = map_y;
	}

	@Override
	public String toString() {
		return "MedicalVO [num=" + num + ", addr=" + addr + ", name=" + name + ", maping=" + maping + ", number="
				+ number + ", ms_time=" + ms_time + ", mc_time=" + mc_time + ", ts_time=" + ts_time + ", tc_time="
				+ tc_time + ", ws_time=" + ws_time + ", wc_time=" + wc_time + ", ths_time=" + ths_time + ", thc_time="
				+ thc_time + ", fs_time=" + fs_time + ", fc_time=" + fc_time + ", ss_time=" + ss_time + ", sc_time="
				+ sc_time + ", medicalid=" + medicalid + ", map_x=" + map_x + ", map_y=" + map_y + "]";
	}
	
	

}
