package com.teafunnycup.dto;

import java.sql.Date;

public class MemberDTO {
	
	private String mid;
	private String mpw;
	private String mname;
	private String mphone;
	private String madd;
	private String memail;
	private String mbirth;
	private Date regdate;
	
	public MemberDTO() {
	
	}
	
	
	
	
	public MemberDTO(String mid) {
		super();
		this.mid = mid;
	}




	public MemberDTO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}




	public MemberDTO(String mid, String mpw, String mname, String mphone, String madd, String memail, String mbirth) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
		this.madd = madd;
		this.memail = memail;
		this.mbirth = mbirth;
	}



	public MemberDTO(String mid, String mpw, String mname, String mphone, String madd, String memail, String mbirth,
			Date regdate) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
		this.madd = madd;
		this.memail = memail;
		this.mbirth = mbirth;
		this.regdate = regdate;
	}



	public String getMid() {
		return mid;
	}



	public void setMid(String mid) {
		this.mid = mid;
	}



	public String getMpw() {
		return mpw;
	}



	public void setMpw(String mpw) {
		this.mpw = mpw;
	}



	public String getMname() {
		return mname;
	}



	public void setMname(String mname) {
		this.mname = mname;
	}



	public String getMphone() {
		return mphone;
	}



	public void setMphone(String mphone) {
		this.mphone = mphone;
	}



	public String getMadd() {
		return madd;
	}



	public void setMadd(String madd) {
		this.madd = madd;
	}



	public String getMemail() {
		return memail;
	}



	public void setMemail(String memail) {
		this.memail = memail;
	}



	public String getMbirth() {
		return mbirth;
	}



	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	
}
