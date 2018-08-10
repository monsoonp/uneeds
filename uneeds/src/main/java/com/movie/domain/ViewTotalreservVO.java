package com.movie.domain;

import java.util.Date;

public class ViewTotalreservVO {
	//상영형태
	private int showtycd; 
	private String showtyname;
	//상영영화
	private int umoviecd;
	//보유영화상세
	private int moviecd;
	private String moviename;
	private int showtm; //상영시간
	private String genres;
	private String imgpath;
	//관람등급
	private int wgradecd;
	private String wgradename;
	//시간표테이블
	private int timetcd;
	//상영관
	private int tnumcd;
	private String tnum;
	//지점
	private int theatercd;
	private String tname;	
	//시간코드
	private int rtimecd;
	private String rtime;
	//예매상세
	private int redetailcd;
	private Date rselectdate; //예매선택일	
	private String peoplecd; //인원상세코드
	private int tpeople;//총인원수
	private String seatcd;//좌석코드
	//결제
	private int paycd;
	private String payname;
	private Double paydrate;
	//할인이벤트
	private int discountcd;
	private String disname;
	private Double disrate;
	
	//예매상태
	private int statecd;
	private String sname;	
	
	//최종예매
	private int reservcd;
	private Date reserdate; //예매한일자
	//회원정보
	private int mcode;
	private String mid;
	
	
	//어드민
	private String ttdate;
	private int ttcash;
	
	
	public ViewTotalreservVO() {
	}



	public ViewTotalreservVO(int showtycd, String showtyname, int umoviecd, int moviecd, String moviename, int showtm,
			String genres, String imgpath, int wgradecd, String wgradename, int timetcd, int tnumcd, String tnum,
			int theatercd, String tname, int rtimecd, String rtime, int redetailcd, Date rselectdate, String peoplecd,
			int tpeople, String seatcd, int paycd, String payname, Double paydrate, int discountcd, String disname,
			Double disrate, int statecd, String sname, int reservcd, Date reserdate, int mcode, String mid,
			String ttdate, int ttcash) {
		super();
		this.showtycd = showtycd;
		this.showtyname = showtyname;
		this.umoviecd = umoviecd;
		this.moviecd = moviecd;
		this.moviename = moviename;
		this.showtm = showtm;
		this.genres = genres;
		this.imgpath = imgpath;
		this.wgradecd = wgradecd;
		this.wgradename = wgradename;
		this.timetcd = timetcd;
		this.tnumcd = tnumcd;
		this.tnum = tnum;
		this.theatercd = theatercd;
		this.tname = tname;
		this.rtimecd = rtimecd;
		this.rtime = rtime;
		this.redetailcd = redetailcd;
		this.rselectdate = rselectdate;
		this.peoplecd = peoplecd;
		this.tpeople = tpeople;
		this.seatcd = seatcd;
		this.paycd = paycd;
		this.payname = payname;
		this.paydrate = paydrate;
		this.discountcd = discountcd;
		this.disname = disname;
		this.disrate = disrate;
		this.statecd = statecd;
		this.sname = sname;
		this.reservcd = reservcd;
		this.reserdate = reserdate;
		this.mcode = mcode;
		this.mid = mid;
		this.ttdate = ttdate;
		this.ttcash = ttcash;
	}

	

	public String getTtdate() {
		return ttdate;
	}



	public void setTtdate(String ttdate) {
		this.ttdate = ttdate;
	}



	public int getTtcash() {
		return ttcash;
	}



	public void setTtcash(int ttcash) {
		this.ttcash = ttcash;
	}



	public int getShowtycd() {
		return showtycd;
	}

	public void setShowtycd(int showtycd) {
		this.showtycd = showtycd;
	}

	public String getShowtyname() {
		return showtyname;
	}

	public void setShowtyname(String showtyname) {
		this.showtyname = showtyname;
	}

	public int getUmoviecd() {
		return umoviecd;
	}

	public void setUmoviecd(int umoviecd) {
		this.umoviecd = umoviecd;
	}

	public int getMoviecd() {
		return moviecd;
	}

	public void setMoviecd(int moviecd) {
		this.moviecd = moviecd;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public int getShowtm() {
		return showtm;
	}

	public void setShowtm(int showtm) {
		this.showtm = showtm;
	}

	public String getGenres() {
		return genres;
	}

	public void setGenres(String genres) {
		this.genres = genres;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public int getWgradecd() {
		return wgradecd;
	}

	public void setWgradecd(int wgradecd) {
		this.wgradecd = wgradecd;
	}

	public String getWgradename() {
		return wgradename;
	}

	public void setWgradename(String wgradename) {
		this.wgradename = wgradename;
	}

	public int getTimetcd() {
		return timetcd;
	}

	public void setTimetcd(int timetcd) {
		this.timetcd = timetcd;
	}

	public int getTnumcd() {
		return tnumcd;
	}

	public void setTnumcd(int tnumcd) {
		this.tnumcd = tnumcd;
	}

	public String getTnum() {
		return tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public int getTheatercd() {
		return theatercd;
	}

	public void setTheatercd(int theatercd) {
		this.theatercd = theatercd;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getRtimecd() {
		return rtimecd;
	}

	public void setRtimecd(int rtimecd) {
		this.rtimecd = rtimecd;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public int getRedetailcd() {
		return redetailcd;
	}

	public void setRedetailcd(int redetailcd) {
		this.redetailcd = redetailcd;
	}

	public Date getRselectdate() {
		return rselectdate;
	}

	public void setRselectdate(Date rselectdate) {
		this.rselectdate = rselectdate;
	}

	public String getPeoplecd() {
		return peoplecd;
	}

	public void setPeoplecd(String peoplecd) {
		this.peoplecd = peoplecd;
	}

	public int getTpeople() {
		return tpeople;
	}

	public void setTpeople(int tpeople) {
		this.tpeople = tpeople;
	}

	public String getSeatcd() {
		return seatcd;
	}

	public void setSeatcd(String seatcd) {
		this.seatcd = seatcd;
	}

	public int getPaycd() {
		return paycd;
	}

	public void setPaycd(int paycd) {
		this.paycd = paycd;
	}

	public String getPayname() {
		return payname;
	}

	public void setPayname(String payname) {
		this.payname = payname;
	}

	public Double getPaydrate() {
		return paydrate;
	}

	public void setPaydrate(Double paydrate) {
		this.paydrate = paydrate;
	}

	public int getDiscountcd() {
		return discountcd;
	}

	public void setDiscountcd(int discountcd) {
		this.discountcd = discountcd;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public Double getDisrate() {
		return disrate;
	}

	public void setDisrate(Double disrate) {
		this.disrate = disrate;
	}

	public int getStatecd() {
		return statecd;
	}

	public void setStatecd(int statecd) {
		this.statecd = statecd;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getReservcd() {
		return reservcd;
	}

	public void setReservcd(int reservcd) {
		this.reservcd = reservcd;
	}

	public Date getReserdate() {
		return reserdate;
	}

	public void setReserdate(Date reserdate) {
		this.reserdate = reserdate;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}



	@Override
	public String toString() {
		return "ViewTotalreservVO [showtycd=" + showtycd + ", showtyname=" + showtyname + ", umoviecd=" + umoviecd
				+ ", moviecd=" + moviecd + ", moviename=" + moviename + ", showtm=" + showtm + ", genres=" + genres
				+ ", imgpath=" + imgpath + ", wgradecd=" + wgradecd + ", wgradename=" + wgradename + ", timetcd="
				+ timetcd + ", tnumcd=" + tnumcd + ", tnum=" + tnum + ", theatercd=" + theatercd + ", tname=" + tname
				+ ", rtimecd=" + rtimecd + ", rtime=" + rtime + ", redetailcd=" + redetailcd + ", rselectdate="
				+ rselectdate + ", peoplecd=" + peoplecd + ", tpeople=" + tpeople + ", seatcd=" + seatcd + ", paycd="
				+ paycd + ", payname=" + payname + ", paydrate=" + paydrate + ", discountcd=" + discountcd
				+ ", disname=" + disname + ", disrate=" + disrate + ", statecd=" + statecd + ", sname=" + sname
				+ ", reservcd=" + reservcd + ", reserdate=" + reserdate + ", mcode=" + mcode + ", mid=" + mid
				+ ", ttdate=" + ttdate + ", ttcash=" + ttcash + ", getTtdate()=" + getTtdate() + ", getTtcash()="
				+ getTtcash() + ", getShowtycd()=" + getShowtycd() + ", getShowtyname()=" + getShowtyname()
				+ ", getUmoviecd()=" + getUmoviecd() + ", getMoviecd()=" + getMoviecd() + ", getMoviename()="
				+ getMoviename() + ", getShowtm()=" + getShowtm() + ", getGenres()=" + getGenres() + ", getImgpath()="
				+ getImgpath() + ", getWgradecd()=" + getWgradecd() + ", getWgradename()=" + getWgradename()
				+ ", getTimetcd()=" + getTimetcd() + ", getTnumcd()=" + getTnumcd() + ", getTnum()=" + getTnum()
				+ ", getTheatercd()=" + getTheatercd() + ", getTname()=" + getTname() + ", getRtimecd()=" + getRtimecd()
				+ ", getRtime()=" + getRtime() + ", getRedetailcd()=" + getRedetailcd() + ", getRselectdate()="
				+ getRselectdate() + ", getPeoplecd()=" + getPeoplecd() + ", getTpeople()=" + getTpeople()
				+ ", getSeatcd()=" + getSeatcd() + ", getPaycd()=" + getPaycd() + ", getPayname()=" + getPayname()
				+ ", getPaydrate()=" + getPaydrate() + ", getDiscountcd()=" + getDiscountcd() + ", getDisname()="
				+ getDisname() + ", getDisrate()=" + getDisrate() + ", getStatecd()=" + getStatecd() + ", getSname()="
				+ getSname() + ", getReservcd()=" + getReservcd() + ", getReserdate()=" + getReserdate()
				+ ", getMcode()=" + getMcode() + ", getMid()=" + getMid() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}


}
