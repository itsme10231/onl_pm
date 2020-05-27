package com.nl.onl.dtos;

import java.util.Date;

public class QnaDto {

	private int seq;
	private int qna_code;
	private String title;
	private String content;
	private String id;
	private Date regdate;
	private int ref;
	private String process;
	private String category_name;
	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaDto(int seq, int qna_code, String title, String content, String id, Date regdate, int ref, String process,
			String category_name) {
		super();
		this.seq = seq;
		this.qna_code = qna_code;
		this.title = title;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
		this.ref = ref;
		this.process = process;
		this.category_name = category_name;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	@Override
	public String toString() {
		return "QnaDto [seq=" + seq + ", qna_code=" + qna_code + ", title=" + title + ", content=" + content + ", id="
				+ id + ", regdate=" + regdate + ", ref=" + ref + ", process=" + process + ", category_name="
				+ category_name + "]";
	}
	
	
}