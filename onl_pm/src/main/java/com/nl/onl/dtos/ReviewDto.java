package com.nl.onl.dtos;

import java.util.Date;

public class ReviewDto {
	private int seq;
	private String id;
	private String target_id;
	private String type;
	private String content;
	private int score;
	private int wanted_seq;
	private Date regdate;
	private String delflag;
	
	private String nickname;
	private String t_nickname;
	
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
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	
	
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getT_nickname() {
		return t_nickname;
	}
	public void setT_nickname(String t_nickname) {
		this.t_nickname = t_nickname;
	}
	
	
	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", target_id=" + target_id + ", type=" + type + ", content="
				+ content + ", score=" + score + ", wanted_seq=" + wanted_seq + ", regdate=" + regdate + ", delflag="
				+ delflag + ", nickname=" + nickname + ", t_nickname=" + t_nickname + "]";
	}
	
}
