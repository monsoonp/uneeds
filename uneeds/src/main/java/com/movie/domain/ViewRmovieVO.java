package com.movie.domain;

//상영영화뷰
public class ViewRmovieVO {
	private int umoviecd;//상영코드
	private int moviecd;//영화코드
	private String moviename;//영화명
	private int wgradecd;//관람등급코드
	private String wgradename;//관람등급명
	private int showtycd;//상영형태코드
	private String showtyname;//상영형태명
	private String imgpath;
	
	public ViewRmovieVO() {}

	public ViewRmovieVO(int umoviecd, int moviecd, String moviename, int wgradecd, String wgradename, int showtycd,
			String showtyname, String imgpath) {
		super();
		this.umoviecd = umoviecd;
		this.moviecd = moviecd;
		this.moviename = moviename;
		this.wgradecd = wgradecd;
		this.wgradename = wgradename;
		this.showtycd = showtycd;
		this.showtyname = showtyname;
		this.imgpath = imgpath;
	}



	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
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

	public int getShowtycd() {
		return showtycd;
	}

	public void setShowtycd(int showtycd) {
		this.showtycd = showtycd;
	}



	public String getMoviename() {
		return moviename;
	}



	public void setMoviename(String moviename) {
		this.moviename = moviename;
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



	public String getShowtyname() {
		return showtyname;
	}



	public void setShowtyname(String showtyname) {
		this.showtyname = showtyname;
	}

	@Override
	public String toString() {
		return "ViewRmovieVO [umoviecd=" + umoviecd + ", moviecd=" + moviecd + ", moviename=" + moviename
				+ ", wgradecd=" + wgradecd + ", wgradename=" + wgradename + ", showtycd=" + showtycd + ", showtyname="
				+ showtyname + ", imgpath=" + imgpath + "]";
	}
	
}
