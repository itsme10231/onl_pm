package com.nl.onl.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.service.ILoginService;


public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	ILoginService loginServiceImp;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		HttpSession session = request.getSession();
		LoginDto ldto = (LoginDto)authentication.getPrincipal();
		
		//wlist에는 wanted_seq만 담겨서 반환
		List<String> wlist = loginServiceImp.getWishList(ldto.getId());
		session.setAttribute("wishlist", wlist);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
