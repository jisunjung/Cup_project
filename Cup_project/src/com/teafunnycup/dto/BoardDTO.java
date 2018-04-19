package com.teafunnycup.dto;

import java.util.Date;

public class BoardDTO {
	 private int bno;
	 private String title;
	 private String content;
	 private String writer;
	 private Date regdate;
	 private int viewcnt;
	 private int replycnt;
	 private int goodcnt;
	
	 public BoardDTO() {
		 
	 }

	 public BoardDTO(int bno, String title, String content, String writer, Date regdate, int viewcnt, int replycnt,
			int goodcnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.goodcnt = goodcnt;
	}



	public BoardDTO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}


	public BoardDTO(int bno, String title, String content, String writer) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}


	public BoardDTO(int bno, String title, String content, String writer, Date regdate, int viewcnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}



	public BoardDTO(String title, String content, String writer) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
	}


	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	
	
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	
	public int getGoodcnt() {
		return goodcnt;
	}
	
	
	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}
	
}



