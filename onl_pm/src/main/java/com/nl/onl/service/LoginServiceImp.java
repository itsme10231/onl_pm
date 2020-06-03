package com.nl.onl.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.ILoginDao;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;

@Service
public class LoginServiceImp implements UserDetailsService,ILoginService{
	
	@Autowired
	private ILoginDao loginDaoImp;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		return loginDaoImp.login(email);
	}

	@Override
	public boolean insertMember(LoginDto ldto) {
		String encodedPw = passwordEncoder.encode(ldto.getPassword());
		
		ldto.setPassword(encodedPw);
		return loginDaoImp.insertMember(ldto);
	}

	@Override
	public String checkEmail(String email) {
		return loginDaoImp.checkEmail(email);
	}

	@Override
	public LoginDto login(String email) {
		return loginDaoImp.login(email);
	}

	@Override
	public boolean updateInfo(LoginDto ldto) {
		return loginDaoImp.updateInfo(ldto);
	}

	@Override
	public boolean updateDelflag(String id) {
		return loginDaoImp.updateDelflag(id);
	}

	@Override
	public boolean deleteMember() {
		return loginDaoImp.deleteMember();
	}

	@Override
	public boolean insertProfile(ProfileDto pdto) {
		return loginDaoImp.insertProfile(pdto);
	}

	@Override
	public ProfileDto getProfile(String id) {
		return loginDaoImp.getProfile(id);
	}

	@Override
	public boolean updateProfile(ProfileDto pdto) {
		return loginDaoImp.updateProfile(pdto);
	}
	
}
