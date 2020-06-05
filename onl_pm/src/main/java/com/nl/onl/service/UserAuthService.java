package com.nl.onl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.ILoginDao;

@Service
public class UserAuthService implements UserDetailsService {
	
	@Autowired
	ILoginDao loginDaoImp;
	
//	public void setLoginDaoImp(ILoginDao loginDaoImp) {
//		this.loginDaoImp = loginDaoImp;
//	}
//	
//	public ILoginDao getLoginDaoImp() {
//		return loginDaoImp;
//	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("ld: "+loginDaoImp);
		return loginDaoImp.login(email);

	}

}
