package com.nl.onl.dtos;

public class WishDto {

	private int seq;
	private String id;
	private int wanted_seq;
	
	private WantedDto wantedDto;
	
	public WantedDto getWantedDto() {
		return wantedDto;
	}

	public void setWantedDto(WantedDto wantedDto) {
		this.wantedDto = wantedDto;
	}

	public WishDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WishDto(int seq, String id, int wanted_seq) {
		super();
		this.seq = seq;
		this.id = id;
		this.wanted_seq = wanted_seq;
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

	@Override
	public String toString() {
		return "WishDto [seq=" + seq + ", id=" + id + ", wanted_seq=" + wanted_seq + "]";
	}
	
	
}
