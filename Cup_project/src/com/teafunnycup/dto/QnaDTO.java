package com.teafunnycup.dto;

import java.sql.Date;

public class QnaDTO {

	private int q_no;
	private String q_contents;
	private String q_name;
	private Date q_date;

	public QnaDTO(){
		
	}

	public QnaDTO(int q_no, String q_contents, String q_name) {
		super();
		this.q_no = q_no;
		this.q_contents = q_contents;
		this.q_name = q_name;
	}

	public QnaDTO(int q_no, String q_contents, String q_name, Date q_date) {
		super();
		this.q_no = q_no;
		this.q_contents = q_contents;
		this.q_name = q_name;
		this.q_date = q_date;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_contents() {
		return q_contents;
	}

	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	
	
}

	