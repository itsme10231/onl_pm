package com.nl.onl.dtos;

import java.util.Date;

public class ChatDto {

	private int seq;
	private String receive_id;
	private String send_id;
	private String content;
	private Date chatdate;
	private String chkflag;
	private String delflag;
	private int wanted_seq;
	
	public ChatDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatDto(int seq, String receive_id, String send_id, String content, Date chatdate, String chkflag,
			String delflag, int wanted_seq) {
		super();
		this.seq = seq;
		this.receive_id = receive_id;
		this.send_id = send_id;
		this.content = content;
		this.chatdate = chatdate;
		this.chkflag = chkflag;
		this.delflag = delflag;
		this.wanted_seq = wanted_seq;
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

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getChatdate() {
		return chatdate;
	}

	public void setChatdate(Date chatdate) {
		this.chatdate = chatdate;
	}

	public String getChkflag() {
		return chkflag;
	}

	public void setChkflag(String chkflag) {
		this.chkflag = chkflag;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public int getWanted_seq() {
		return wanted_seq;
	}

	public void setWanted_seq(int wanted_seq) {
		this.wanted_seq = wanted_seq;
	}

	@Override
	public String toString() {
		return "ChatDto [seq=" + seq + ", receive_id=" + receive_id + ", send_id=" + send_id + ", content=" + content
				+ ", chatdate=" + chatdate + ", chkflag=" + chkflag + ", delflag=" + delflag + ", wanted_seq="
				+ wanted_seq + "]";
	}
	
}
