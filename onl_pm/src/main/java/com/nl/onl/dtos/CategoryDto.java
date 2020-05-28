package com.nl.onl.dtos;

public class CategoryDto {
	
	private int code1;
	private String category_name1;
	private int code2;
	private String category_name2;
	
	public int getCode1() {
		return code1;
	}
	public void setCode1(int code1) {
		this.code1 = code1;
	}
	public String getCategory_name1() {
		return category_name1;
	}
	public void setCategory_name1(String category_name1) {
		this.category_name1 = category_name1;
	}
	public int getCode2() {
		return code2;
	}
	public void setCode2(int code2) {
		this.code2 = code2;
	}
	public String getCategory_name2() {
		return category_name2;
	}
	public void setCategory_name2(String category_name2) {
		this.category_name2 = category_name2;
	}
	
	
	@Override
	public String toString() {
		return "CategoryDto [code1=" + code1 + ", category_name1=" + category_name1 + ", code2=" + code2
				+ ", category_name2=" + category_name2 + "]";
	}
	
}
