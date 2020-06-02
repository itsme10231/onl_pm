package com.nl.onl.dtos;

import java.util.Date;

public class FileDto {
	private int seq;
	private String origin_name;
	private String stored_name;
	private Date regdate;
	private String delflag;
	private String board_type;
	private String id;
	private int post_seq;
	
	
	public FileDto() {

	}
	
	
	public FileDto(int seq, String origin_name, String stored_name, Date regdate, String delflag, String board_type,
			String id, int post_seq) {
		super();
		this.seq = seq;
		this.origin_name = origin_name;
		this.stored_name = stored_name;
		this.regdate = regdate;
		this.delflag = delflag;
		this.board_type = board_type;
		this.id = id;
		this.post_seq = post_seq;
	}


	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getStored_name() {
		return stored_name;
	}
	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
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
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	
	
	
	@Override
	public String toString() {
		return "FileDto [seq=" + seq + ", origin_name=" + origin_name + ", stored_name=" + stored_name + ", regdate="
				+ regdate + ", delflag=" + delflag + ", board_type=" + board_type + ", id=" + id + ", post_seq="
				+ post_seq + "]";
	}
	
	
}
