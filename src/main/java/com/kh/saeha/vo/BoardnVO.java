package com.kh.saeha.vo;

import java.sql.Date;

//SQL> create table sae_boardn(
//2  n_bno number PRIMARY KEY,
//3  n_title varchar2(150) not null,
//4  n_content varchar2(4000) not null,
//5  n_regdate date default sysdate,
//6  n_file varchar2(300));

public class BoardnVO {
	
	private int n_bno;
	private String title;
	private String content;
	private Date regdate;
	private String file;
	
	
	public int getN_bno() {
		return n_bno;
	}
	public void setN_bno(int n_bno) {
		this.n_bno = n_bno;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "BoardnVO [n_bno=" + n_bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", file=" + file + "]";
	}
	
	

}
