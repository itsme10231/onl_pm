package com.nl.onl.dtos;

public class SearchDto {
	private String id;
	private String title;
	private String[] category;
	private String salary;
	private String timezone;
	private String time;
	private String location;
	private String score;
	private String sortType;
	private String align;

	private String pnum;
	

	public SearchDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public SearchDto(String title, String category[], String salary, String timezone, String time, String location,
			String score, String sortType, String align, String pnum, String id) {
		super();
		this.title = title;
		this.category = category;
		this.salary = salary;
		this.timezone = timezone;
		this.time = time;
		this.location = location;
		this.score = score;
		this.sortType = sortType;
		this.align = align;
		this.pnum = pnum;
		this.id = id;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}
	



	@Override
	public String toString() {
		return "SearchDto [id=" + id + ", title=" + title + ", category=" + category + ", salary=" + salary
				+ ", timezone=" + timezone + ", time=" + time + ", location=" + location + ", score=" + score
				+ ", sortType=" + sortType + ", align=" + align + ", pnum=" + pnum + "]";
	}
	
	
}
