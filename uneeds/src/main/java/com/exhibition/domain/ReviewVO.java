package com.exhibition.domain;

import java.util.Date;

public class ReviewVO {
	private Integer reviewNum;
	private int seq;
	private int mcode;
	private String review;
	private int grade;
	private Date regDate;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(Integer reviewNum, int seq, int mcode, String review, int grade, Date regDate) {
		super();
		this.reviewNum = reviewNum;
		this.seq = seq;
		this.mcode = mcode;
		this.review = review;
		this.grade = grade;
		this.regDate = regDate;
	}

	public Integer getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(Integer reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", seq=" + seq + ", mcode=" + mcode + ", review=" + review
				+ ", grade=" + grade + ", regDate=" + regDate + "]";
	}
	
	

}
