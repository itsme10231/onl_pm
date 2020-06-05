package com.nl.onl.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


import com.nl.onl.dtos.LoginDto;
import com.nl.onl.service.UserAuthService;

public class OnlAuthProvider extends DaoAuthenticationProvider {
	

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		System.out.println("provider 호출");
		String email = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		System.out.println("email: "+ email);
		
		LoginDto dto = (LoginDto) getUserDetailsService().loadUserByUsername(email);
		
		if(dto == null) {
			throw new UsernameNotFoundException(email);
		}
		
		System.out.println(passwordEncoder.matches(password, dto.getPassword()));
		
		
		if (!passwordEncoder.matches(password, dto.getPassword())) {
			throw new BadCredentialsException(email);
		}
		
		if(!dto.isEnabled()) {
			throw new DisabledException(email);
		}
		
		List<GrantedAuthority> roles = (List<GrantedAuthority>) dto.getAuthorities();
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(dto.getId(), password, roles);
		
		return auth;
	}
	
	
}
