package com.exhibition.domain;

import java.util.Date;

public class ExhibitionVO {
	private Integer seq;
	private String title;
	private int realmId;
	private int areaId;
	private String place;
	private Date startDate;
	private Date endDate;
	private String gpsx;
	private String gpsy;
	private int viewCnt;
	
	private int likeCnt;
	private int reviewCnt;
	
	public ExhibitionVO() {
		// TODO Auto-generated constructor stub
	}

	public ExhibitionVO(Integer seq, String title, int realmId, int areaId, String place, Date startDate, Date endDate,
			String gpsx, String gpsy, int viewCnt) {
		super();
		this.seq = seq;
		this.title = title;
		this.realmId = realmId;
		this.areaId = areaId;
		this.place = place;
		this.startDate = startDate;
		this.endDate = endDate;
		this.gpsx = gpsx;
		this.gpsy = gpsy;
		this.viewCnt = viewCnt;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRealmId() {
		return realmId;
	}

	public void setRealmId(int realmId) {
		this.realmId = realmId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getGpsx() {
		return gpsx;
	}

	public void setGpsx(String gpsx) {
		this.gpsx = gpsx;
	}

	public String getGpsy() {
		return gpsy;
	}

	public void setGpsy(String gpsy) {
		this.gpsy = gpsy;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}

	@Override
	public String toString() {
		return "ExhibitionVO [seq=" + seq + ", title=" + title + ", realmId=" + realmId + ", areaId=" + areaId
				+ ", place=" + place + ", startDate=" + startDate + ", endDate=" + endDate + ", gpsx=" + gpsx
				+ ", gpsy=" + gpsy + ", viewCnt=" + viewCnt + ", likeCnt=" + likeCnt + ", reviewCnt=" + reviewCnt + "]";
	}
	
	

}
