package com.nl.onl.dtos;

public class UserlistDto {

	private int seq;
	private String id;
	private String list_id;
	private String type;
	
	private String nickname;
	
	private String stored_name;
	
	public UserlistDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserlistDto(int seq, String id, String list_id, String type) {
		super();
		this.seq = seq;
		this.id = id;
		this.list_id = list_id;
		this.type = type;
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

	public String getList_id() {
		return list_id;
	}

	public void setList_id(String list_id) {
		this.list_id = list_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

	public String getStored_name() {
		return stored_name;
	}

	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}

	@Override
	public String toString() {
		return "UserlistDto [seq=" + seq + ", id=" + id + ", list_id=" + list_id + ", type=" + type + ", nickname="
				+ nickname + "]";
	}

	
	
}
