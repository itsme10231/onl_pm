package com.nl.onl.dtos;

import java.util.Date;

public class NotifyDto {
	
	private int seq;
	private String receive_id;
	private String noti_category;
	private String content;
	private String url;
	private Date regdate;
	private Date chkdate;
	
	private String paramid;
	private String paramname;
	private String paramseq;
	
	
	public NotifyDto(int seq, String receive_id, String noti_category, String content, String url, Date regdate,
			Date chkdate, String paramid, String paramseq, String paramname) {
		super();
		this.seq = seq;
		this.receive_id = receive_id;
		this.noti_category = noti_category;
		this.content = content;
		this.url = url;
		this.regdate = regdate;
		this.chkdate = chkdate;
		this.paramid = paramid;
		this.paramseq = paramseq;
		this.paramname = paramname;
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
	public String getNoti_category() {
		return noti_category;
	}
	public void setNoti_category(String noti_category) {
		this.noti_category = noti_category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getChkdate() {
		return chkdate;
	}
	public void setChkdate(Date chkdate) {
		this.chkdate = chkdate;
	}
	
	
	
	
	
	
	public String getParamid() {
		return paramid;
	}

	public void setParamid(String paramid) {
		this.paramid = paramid;
	}


	public String getParamseq() {
		return paramseq;
	}


	public void setParamseq(String paramseq) {
		this.paramseq = paramseq;
	}

	public String getParamname() {
		return paramname;
	}


	public void setParamname(String paramname) {
		this.paramname = paramname;
	}

	

	@Override
	public String toString() {
		return "NotifyDto [seq=" + seq + ", receive_id=" + receive_id + ", noti_category=" + noti_category
				+ ", content=" + content + ", url=" + url + ", regdate=" + regdate + ", chkdate=" + chkdate + "]";
	}
	
	
	
	
}
