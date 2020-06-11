package com.nl.onl.dtos;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class WantedDto {
	private int seq;
	private String id;
	private int category;
	private String title;
	private Date regdate;
	private Date deadline;
	private String sdate;
	private String edate;
	private int location;
	private String stime;
	private String etime;
	private int salary;
	private String content;
	private String phone;
	private int views;
	private String state;
	private String delflag;
	private String sosflag;
	private int selector;
	private String loc_detail;
	
	private String loc_name;
	private String whitelist;
	private String wishlist;
	private int apply_c;
	private String category_name1;
	private String category_name2;
	private String nickname;
	private ApplyDto applyDto;
	private FileDto fileDto;
	
	private List<MultipartFile> files;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCategory_name1() {
		return category_name1;
	}
	public void setCategory_name1(String category_name1) {
		this.category_name1 = category_name1;
	}
	public String getCategory_name2() {
		return category_name2;
	}
	public void setCategory_name2(String category_name2) {
		this.category_name2 = category_name2;
	}
	public int getApply_c() {
		return apply_c;
	}
	public void setApply_c(int apply_c) {
		this.apply_c = apply_c;
	}
	public int getSelector() {
		return selector;
	}
	public void setSelector(int selector) {
		this.selector = selector;
	}

	
	
	public FileDto getFileDto() {
		return fileDto;
	}
	public void setFileDto(FileDto fileDto) {
		this.fileDto = fileDto;
	}
	public ApplyDto getApplyDto() {
		return applyDto;
	}
	public void setApplyDto(ApplyDto applyDto) {
		this.applyDto = applyDto;
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
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	public String getSosflag() {
		return sosflag;
	}
	public void setSosflag(String sosflag) {
		this.sosflag = sosflag;
	}
	
	public String getLoc_detail() {
		return loc_detail;
	}
	public void setLoc_detail(String loc_detail) {
		this.loc_detail = loc_detail;
	}
	
	
	
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	public String getWhitelist() {
		return whitelist;
	}
	public void setWhitelist(String whitelist) {
		this.whitelist = whitelist;
	}
	public String getWishlist() {
		return wishlist;
	}
	public void setWishlist(String wishlist) {
		this.wishlist = wishlist;
	}
	
	
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
	@Override
	public String toString() {
		return "WantedDto [seq=" + seq + ", id=" + id + ", category=" + category + ", title=" + title + ", regdate="
				+ regdate + ", deadline=" + deadline + ", sdate=" + sdate + ", edate=" + edate + ", location="
				+ location + ", stime=" + stime + ", etime=" + etime + ", salary=" + salary + ", content=" + content
				+ ", phone=" + phone + ", views=" + views + ", state=" + state + ", delflag=" + delflag + ", sosflag="
				+ sosflag + ", selector=" + selector + ", loc_detail=" + loc_detail + ", loc_name=" + loc_name
				+ ", whitelist=" + whitelist + ", wishlist=" + wishlist + ", apply_c=" + apply_c + ", category_name1="
				+ category_name1 + ", category_name2=" + category_name2 + ", nickname=" + nickname + ", applyDto="
				+ applyDto + "]";
	}
	
	
}
