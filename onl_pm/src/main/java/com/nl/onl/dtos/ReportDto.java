package com.nl.onl.dtos;

import java.util.Date;

public class ReportDto {
	
	private int seq;
	private String id;
	private String reported_id;
	private String category_seq;
	private String c_content;
	private String process;
	private Date regdate;
	private String content;
	
	public ReportDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportDto(int seq, String id, String reported_id, String category_seq, String c_content, String process,
			Date regdate, String content) {
		super();
		this.seq = seq;
		this.id = id;
		this.reported_id = reported_id;
		this.category_seq = category_seq;
		this.c_content = c_content;
		this.process = process;
		this.regdate = regdate;
		this.content = content;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReported_id() {
		return reported_id;
	}
	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}
	public String getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(String category_seq) {
		this.category_seq = category_seq;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ReportDto [seq=" + seq + ", id=" + id + ", reported_id=" + reported_id + ", category_seq="
				+ category_seq + ", c_content=" + c_content + ", process=" + process + ", regdate=" + regdate
				+ ", content=" + content + "]";
	}
	
	
}
