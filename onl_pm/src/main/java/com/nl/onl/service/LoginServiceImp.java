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
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		return loginDaoImp.login(id);
	}

	@Override
	public int insertMember(LoginDto ldto) {
		String encodedPw = passwordEncoder.encode(ldto.getPassword());
		
		ldto.setPassword(encodedPw);
		return loginDaoImp.insertMember(ldto);
	}

	@Override
	public String checkId(String id) {
		return loginDaoImp.checkId(id);
	}

	@Override
	public LoginDto login(String id) {
		return loginDaoImp.login(id);
	}

	@Override
	public int updateInfo(LoginDto ldto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDelflag(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProfile(ProfileDto pdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProfileDto getProfile(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProfile(ProfileDto pdto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
