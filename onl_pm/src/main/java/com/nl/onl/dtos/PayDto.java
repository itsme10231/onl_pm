package com.nl.onl.dtos;

import java.util.Date;

public class PayDto {
	private int wanted_seq;
	private String search_agree;
	private String offer_agree;
	private Date regdate;
	private int suggestion;
	
	public int getWanted_seq() {
		return wanted_seq;
	}
	public void setWanted_seq(int wanted_seq) {
		this.wanted_seq = wanted_seq;
	}
	public String getSearch_agree() {
		return search_agree;
	}
	public void setSearch_agree(String search_agree) {
		this.search_agree = search_agree;
	}
	public String getOffer_agree() {
		return offer_agree;
	}
	public void setOffer_agree(String offer_agree) {
		this.offer_agree = offer_agree;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(int suggestion) {
		this.suggestion = suggestion;
	}
	
	
	@Override
	public String toString() {
		return "PayDto [wanted_seq=" + wanted_seq + ", search_agree=" + search_agree + ", offer_agree=" + offer_agree
				+ ", regdate=" + regdate + ", suggestion=" + suggestion + "]";
	}
	
	
}
