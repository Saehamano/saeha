package com.kh.saeha.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	
	private String go_bno;
	private String go_name;
	private String go_content;
	private String go_file;
	private int go_price;
	private int go_stock;
	private int go_readcount;
	private Date go_date;
	private MultipartFile UploadFile;
	
	public MultipartFile getUploadFile() {
		return UploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		UploadFile = uploadFile;
	}
	public String getGo_bno() {
		return go_bno;
	}
	public void setGo_bno(String go_bno) {
		this.go_bno = go_bno;
	}
	public String getGo_name() {
		return go_name;
	}
	public void setGo_name(String go_name) {
		this.go_name = go_name;
	}
	public String getGo_content() {
		return go_content;
	}
	public void setGo_content(String go_content) {
		this.go_content = go_content;
	}
	public String getGo_file() {
		return go_file;
	}
	public void setGo_file(String go_file) {
		this.go_file = go_file;
	}
	public int getGo_price() {
		return go_price;
	}
	public void setGo_price(int go_price) {
		this.go_price = go_price;
	}
	public int getGo_stock() {
		return go_stock;
	}
	public void setGo_stock(int go_stock) {
		this.go_stock = go_stock;
	}
	public int getGo_readcount() {
		return go_readcount;
	}
	public void setGo_readcount(int go_readcount) {
		this.go_readcount = go_readcount;
	}
	public Date getGo_date() {
		return go_date;
	}
	public void setGo_date(Date go_date) {
		this.go_date = go_date;
	}
	@Override
	public String toString() {
		return "GoodsVO [go_bno=" + go_bno + ", go_name=" + go_name + ", go_content=" + go_content + ", go_file="
				+ go_file + ", go_price=" + go_price + ", go_stock=" + go_stock + ", go_readcount=" + go_readcount
				+ ", go_date=" + go_date + "]";
	}
	
	
	
}
