package com.nl.onl.dtos;

public class ProfileDto {
	private int seq;
	private String id;
	private String intro;
	private String location_able;
	
	private int search_score;
	private int offer_score;
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getLocation_able() {
		return location_able;
	}
	public void setLocation_able(String location_able) {
		this.location_able = location_able;
	}
	public int getSearch_score() {
		return search_score;
	}
	public void setSearch_score(int search_score) {
		this.search_score = search_score;
	}
	public int getOffer_score() {
		return offer_score;
	}
	public void setOffer_score(int offer_score) {
		this.offer_score = offer_score;
	}
	
	
	
	
	@Override
	public String toString() {
		return "ProfileDto [seq=" + seq + ", id=" + id + ", intro=" + intro + ", location_able=" + location_able
				+ ", search_score=" + search_score + ", offer_score=" + offer_score + ", nickname=" + nickname + "]";
	}
	
	
}
