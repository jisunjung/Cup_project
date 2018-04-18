package com.teafunnycup.dto;

// 한페이지에 10건씩 보여주기 위해 CriteriaDTO
// 검색기준 또는 분류기준
public class CriteriaDTO {
	
	private int page;						// 페이지 번호 (하단의 번호들 클릭)
	private int perPageNum;					// 한 페이지에 보여줄 게시글 수
	private String keyword;
	private String flag;
	

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public CriteriaDTO() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {					// getPage는 그대로 두고
		return page;
	}

	public void setPage(int page) {			// setPage만 수정
		if(page <=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}
	
	// method for MyBatis SQL Mapper : 조회 시작 Row 취득하는 메서드
	public int getPageStart() {				
		return(((this.page-1)*perPageNum) + 1);
	}
	
	// method for MyBatis SQL Mapper : 조회 마지막 Row 취득하는 메서드
	public int getPerPageNum() {
		return this.page * perPageNum;
		// 2 페이지 x 10 = 20번 게시글까지 출력
	}
	public CriteriaDTO(int page, int perPageNum, String keyword) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
}
