package com.movie.domain;

//상영영화테이블
public class ReleaseVO {
	private int umoviecd;//상영코드
	private int moviecd;//영화코드
	private int showtycd;//상영형태코드
	
	public ReleaseVO() {}

	public ReleaseVO(int umoviecd, int moviecd, int showtycd) {
		super();
		this.umoviecd = umoviecd;
		this.moviecd = moviecd;
		this.showtycd = showtycd;
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

	@Override
	public String toString() {
		return "ReleaseVO [umoviecd=" + umoviecd + ", moviecd=" + moviecd + ", showtycd=" + showtycd + "]";
	}
	
	
}
