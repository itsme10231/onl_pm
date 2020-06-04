package com.nl.onl.dtos;

import java.util.Date;

public class ChatlistDto {

	private String target;
	private int wanted_seq;
	private String title;
	private int notread_c;
	private String content;
	private Date chatdate;
	
	private String nickname;
	
	public ChatlistDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatlistDto(String target, int wanted_seq, String title, int notread_c, String content, Date chatdate) {
		super();
		this.target = target;
		this.wanted_seq = wanted_seq;
		this.title = title;
		this.notread_c = notread_c;
		this.content = content;
		this.chatdate = chatdate;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getWanted_seq() {
		return wanted_seq;
	}

	public void setWanted_seq(int wanted_seq) {
		this.wanted_seq = wanted_seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getNotread_c() {
		return notread_c;
	}

	public void setNotread_c(int notread_c) {
		this.notread_c = notread_c;
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
	
	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "ChatlistDto [target=" + target + ", wanted_seq=" + wanted_seq + ", title=" + title + ", notread_c="
				+ notread_c + ", content=" + content + ", chatdate=" + chatdate + ", nickname=" + nickname + "]";
	}


	
}

