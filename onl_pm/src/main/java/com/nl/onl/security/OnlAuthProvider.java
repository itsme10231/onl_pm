package com.nl.onl.security;

import java.util.List;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.nl.onl.dtos.LoginDto;

public class OnlAuthProvider extends DaoAuthenticationProvider {
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String id = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		
		LoginDto dto = (LoginDto) getUserDetailsService().loadUserByUsername(id);
		
		if (!((BCryptPasswordEncoder) getPasswordEncoder()).matches(password, dto.getPassword())) {
			throw new BadCredentialsException(id);
		}
		
		if(!dto.isEnabled()) {
			throw new DisabledException(id);
		}
		
		List<GrantedAuthority> roles = (List<GrantedAuthority>) dto.getAuthorities();
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(id, password, roles);
		
		return auth;
	}
	
	

}
