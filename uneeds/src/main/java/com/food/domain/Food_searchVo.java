package com.food.domain;

public class Food_searchVo {
	private String keyword;
	private int page;
	private int perPageNum;
	private int kid;

	public Food_searchVo() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}
	
	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	@Override
	public String toString() {
		return "Food_searchVo [keyword=" + keyword + ", page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
