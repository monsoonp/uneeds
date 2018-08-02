package com.movie.domain;

import java.util.Date;

//영화상세테이블
public class MovieVO {
	private int moviecd; //영화코드
	private String moviename;//영화명
	private int showtm;//상영시간
	private Date openDt;//개봉일자
	private String genres;//장르
	private String imgpath;//이미지경로
	private String directors;//감독
	private String actors;//배우
	
	public MovieVO() {}

	public MovieVO(int moviecd, String moviename, int showtm, Date openDt, String genres, String imgpath,
			String directors, String actors) {
		super();
		this.moviecd = moviecd;
		this.moviename = moviename;
		this.showtm = showtm;
		this.openDt = openDt;
		this.genres = genres;
		this.imgpath = imgpath;
		this.directors = directors;
		this.actors = actors;
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

	public Date getOpenDt() {
		return openDt;
	}

	public void setOpenDt(Date openDt) {
		this.openDt = openDt;
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

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	@Override
	public String toString() {
		return "MovieVO [moviecd=" + moviecd + ", moviename=" + moviename + ", showtm=" + showtm + ", openDt=" + openDt
				+ ", genres=" + genres + ", imgpath=" + imgpath + ", directors=" + directors + ", actors=" + actors
				+ "]";
	}
	
	
}
