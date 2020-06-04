package com.nl.onl.dtos;

import java.util.Date;

public class ApplyDto {
	
	private int seq;
	private String id;
	private int wanted_seq;
	private Date regdate;
	private int acount;
	
	private String nickname;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public int getWanted_seq() {
		return wanted_seq;
	}
	public void setWanted_seq(int wanted_seq) {
		this.wanted_seq = wanted_seq;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getAcount() {
		return acount;
	}
	public void setAcount(int acount) {
		this.acount = acount;
	}
	
	
	@Override
	public String toString() {
		return "ApplyDto [seq=" + seq + ", id=" + id + ", wanted_seq=" + wanted_seq + ", regdate=" + regdate
				+ ", acount=" + acount + ", nickname=" + nickname + "]";
	}
	
	
	
	
}
