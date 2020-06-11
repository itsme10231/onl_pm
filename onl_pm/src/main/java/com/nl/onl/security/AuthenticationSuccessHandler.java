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

import com.nl.onl.dtos.WishDto;
import com.nl.onl.service.IMyPageService;

public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		HttpSession session = request.getSession();
		
		Map<String, String> map = new HashMap<>();
		
		
		
		List<WishDto> wlist = myPageServiceImp.getWishlist(map);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
