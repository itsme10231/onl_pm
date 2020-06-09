package com.nl.onl.util;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class Util {

	public String random() {
		
		int ran;
		String dom ="";
		ran = (int) (Math.random()*10);
		
			for (int i = 0; i < 6; i++) {
				dom+=(int) (Math.random()*10);
			}
			
		return dom;
	}
	
	public boolean getAuthor() {
		// 시큐리티 컨텍스트 객체를 얻습니다. 
		SecurityContext context = SecurityContextHolder.getContext(); 
		// 인증 객체를 얻습니다. 
		Authentication authentication = context.getAuthentication(); 
		// 로그인한 사용자정보를 가진 객체를 얻습니다. 
		Principal principal = (Principal) authentication.getPrincipal();

		return false;
	}
}
