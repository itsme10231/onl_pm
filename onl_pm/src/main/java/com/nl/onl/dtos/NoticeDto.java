package com.nl.onl.dtos;

import java.util.Date;

public class NoticeDto {
	
	private int seq;
	private String noticeflag;
	private String title;
	private String content;
	private Date regdate;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDto(int seq, String noticeflag, String title, String content, Date regdate) {
		super();
		this.seq = seq;
		this.noticeflag = noticeflag;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getNoticeflag() {
		return noticeflag;
	}
	public void setNoticeflag(String noticeflag) {
		this.noticeflag = noticeflag;
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
	@Override
	public String toString() {
		return "NoticeDto [seq=" + seq + ", noticeflag=" + noticeflag + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	
	
}
