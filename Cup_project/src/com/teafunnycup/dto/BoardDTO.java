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
	 private String filename;
	 private int filesize;
	 private int downcnt;
	 private int ref;				// 답변 그룹 번호
	 private int re_step;			// 출력 순서
	 private int re_level;			// 답변 단계
	
	 
	 public BoardDTO() {
		 
	 }

	 
	 
	 
	 
	 public BoardDTO(String title, String content, String writer, String filename, int filesize, int ref, int re_step,
			int re_level) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filesize = filesize;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
	}





	public BoardDTO(int bno, String title, String content, String writer, Date regdate, int viewcnt, int replycnt,
			int goodcnt, String filename, int filesize, int downcnt, int ref, int re_step, int re_level) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.goodcnt = goodcnt;
		this.filename = filename;
		this.filesize = filesize;
		this.downcnt = downcnt;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
	}





	public BoardDTO(String title, String content, String writer, String filename, int filesize) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filesize = filesize;
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





	public String getFilename() {
		return filename;
	}





	public void setFilename(String filename) {
		this.filename = filename;
	}





	public int getFilesize() {
		return filesize;
	}





	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}





	public int getRef() {
		return ref;
	}





	public void setRef(int ref) {
		this.ref = ref;
	}





	public int getRe_step() {
		return re_step;
	}





	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}





	public int getRe_level() {
		return re_level;
	}





	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}





	public int getDowncnt() {
		return downcnt;
	}





	public void setDowncnt(int downcnt) {
		this.downcnt = downcnt;
	}
	
	
}



