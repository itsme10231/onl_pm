package com.nl.onl.dtos;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class WantedDto {
	private int seq;
	private String id;
	private int category;
	private String title;
	private Date regdate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline;
	
	private String sdate;
	private String edate;
	private String location;
	private String stime;
	private String etime;
	private int salary;
	private String content;
	private String phone;
	private int views;
	private String state;
	private String delflag;
	private String sosflag;
	private String selector;
	private String loc_detail;
	
	private String loc_name;
	private String whitelist;
	private String wishlist;
	private int apply_c;
	private String apply;
	private String selected;
	private String result_c;
	private int rn;
	
	private String nickname;
	private ApplyDto applyDto;
	private FileDto fileDto;
	private CategoryDto categoryDto;
	
	private List<MultipartFile> files;
	
	

	public WantedDto() {

	}
	
	
	
	
	public WantedDto(String id, int category, String title, Date deadline, String sdate, String edate,
			String location, String stime, String etime, int salary, String content, String phone, 
			String sosflag, String loc_detail) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.deadline = deadline;
		this.sdate = sdate;
		this.edate = edate;
		this.location = location;
		this.stime = stime;
		this.etime = etime;
		this.salary = salary;
		this.content = content;
		this.phone = phone;
		this.sosflag = sosflag;
		this.loc_detail = loc_detail;
	}




	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getApply_c() {
		return apply_c;
	}
	public void setApply_c(int apply_c) {
		this.apply_c = apply_c;
	}
	public String getSelector() {
		return selector;
	}
	public void setSelector(String selector) {
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
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
	
	
	
	
	public String getApply() {
		return apply;
	}




	public void setApply(String apply) {
		this.apply = apply;
	}




	public String getSelected() {
		return selected;
	}




	public void setSelected(String selected) {
		this.selected = selected;
	}




	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}




	public CategoryDto getCategoryDto() {
		return categoryDto;
	}




	public void setCategoryDto(CategoryDto categoryDto) {
		this.categoryDto = categoryDto;
	}

	


	public String getResult_c() {
		return result_c;
	}




	public void setResult_c(String result_c) {
		this.result_c = result_c;
	}

	


	public int getRn() {
		return rn;
	}




	public void setRn(int rn) {
		this.rn = rn;
	}




	@Override
	public String toString() {
		return "WantedDto [seq=" + seq + ", id=" + id + ", category=" + category + ", title=" + title + ", regdate="
				+ regdate + ", deadline=" + deadline + ", sdate=" + sdate + ", edate=" + edate + ", location="
				+ location + ", stime=" + stime + ", etime=" + etime + ", salary=" + salary + ", content=" + content
				+ ", phone=" + phone + ", views=" + views + ", state=" + state + ", delflag=" + delflag + ", sosflag="
				+ sosflag + ", selector=" + selector + ", loc_detail=" + loc_detail + ", loc_name=" + loc_name
				+ ", whitelist=" + whitelist + ", wishlist=" + wishlist + ", apply_c=" + apply_c + ", apply=" + apply
				+ ", selected=" + selected + ", nickname=" + nickname + ", applyDto=" + applyDto + ", fileDto="
				+ fileDto + ", categoryDto=" + categoryDto + ", files=" + files + "]";
	}








	
	
	
	
	
}
