package com.nl.onl.dtos;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class LoginDto implements UserDetails, Principal {
	private String id;
	private String password;
	private String name;
	private String address_1;
	private String address_2;
	private String address_3;
	private String email;
	private String nickname;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	private String delflag;
	private Date regdate;
	private String role;
	private String phone;
	private String hasacc;
	
	private String regflag;
	private ReportDto reportDto;
	private String stored_name;
	
	
	public LoginDto() {

	}


	public LoginDto(String id, String password, String name, String address_1, String address_2, String address_3,
			String email, String nickname, Date birth, String delflag, Date regdate, String role, String phone,
			String regflag) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address_1 = address_1;
		this.address_2 = address_2;
		this.address_3 = address_3;
		this.email = email;
		this.nickname = nickname;
		this.birth = birth;
		this.delflag = delflag;
		this.regdate = regdate;
		this.role = role;
		this.phone = phone;
		this.regflag = regflag;
	}





	public ReportDto getReportDto() {
		return reportDto;
	}
	public void setReportDto(ReportDto reportDto) {
		this.reportDto = reportDto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress_1() {
		return address_1;
	}
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getAddress_2() {
		return address_2;
	}
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	public String getAddress_3() {
		return address_3;
	}
	public void setAddress_3(String address_3) {
		this.address_3 = address_3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
	public String getRegflag() {
		return regflag;
	}


	public void setRegflag(String regflag) {
		this.regflag = regflag;
	}
	
	

	
	
	public String getHasacc() {
		return hasacc;
	}


	public void setHasacc(String hasacc) {
		this.hasacc = hasacc;
	}


	public String getStored_name() {
		return stored_name;
	}


	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}


	@Override
	public String toString() {
		return "LoginDto [id=" + id + ", password=" + password + ", name=" + name + ", address_1=" + address_1
				+ ", address_2=" + address_2 + ", address_3=" + address_3 + ", email=" + email + ", nickname="
				+ nickname + ", birth=" + birth + ", delflag=" + delflag + ", regdate=" + regdate + ", role=" + role
				+ ", phone=" + phone + ", regflag=" + regflag + ", hasacc=" + hasacc + ", reportDto=" + reportDto + "]";
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String roleGrant = "ROLE_"+role;
		
		GrantedAuthority gr = new SimpleGrantedAuthority(roleGrant);
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(gr);
		
		return authorities;
	}
	@Override
	public String getUsername() {
		return email;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return delflag.equals("N")?true:false;
	}
	
	
}
