package com.teafunnycup.dto;

public class ProductDTO {
	private String p_class;
	private String p_code;
	private String p_name;
	private String p_price2;
	private String p_img;
	private String p_detailimg;
	
	
	public ProductDTO() {
		
	}
	
	
	public ProductDTO(String p_class, String p_code, String p_name, String p_price2, String p_img, String p_detailimg) {
		super();
		this.p_class = p_class;
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price2 = p_price2;
		this.p_img = p_img;
		this.p_detailimg = p_detailimg;
	}


	public ProductDTO(String p_code, String p_name, String p_price2, String p_img) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price2 = p_price2;
		this.p_img = p_img;
	}


	public String getP_code() {
		return p_code;
	}


	public void setP_code(String p_code) {
		this.p_code = p_code;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_price2() {
		return p_price2;
	}


	public void setP_price2(String p_price2) {
		this.p_price2 = p_price2;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	public String getP_class() {
		return p_class;
	}


	public void setP_class(String p_class) {
		this.p_class = p_class;
	}


	public String getP_detailimg() {
		return p_detailimg;
	}


	public void setP_detailimg(String p_detailimg) {
		this.p_detailimg = p_detailimg;
	}
	
	
	
	
}
