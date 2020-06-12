package com.nl.onl.dtos;

public class LocDto {
	
	private int code;
	private String loc_name;
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	
	@Override
	public String toString() {
		return "LocDto [code=" + code + ", loc_name=" + loc_name + "]";
	}
	
	
}
