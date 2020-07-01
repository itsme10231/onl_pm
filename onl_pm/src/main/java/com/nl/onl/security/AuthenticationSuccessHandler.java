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
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.service.ILoginService;


public class AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	private RequestCache requestC = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	
	
	
	@Autowired
	ILoginService loginServiceImp;
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {


		LoginDto ldto = (LoginDto)authentication.getPrincipal();
		
		//wlist에는 wanted_seq만 담겨서 반환
//		List<String> wlist = loginServiceImp.getWishList(ldto.getId());
//		List<String> alist = loginServiceImp.getApplySeq(ldto.getId());
		
//		session.setAttribute("wishlist", wlist);
//		session.setAttribute("applylist", alist);
		
		if(ldto.getRole().equals("USER")) {
			redirectStratgy.sendRedirect(request, response, "/");
		}else {
			redirectStratgy.sendRedirect(request, response, "/reportlist.do");
		}
		
		
		clearAuthenticationAttributes(request);
//		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
        SavedRequest savedRequest = requestC.getRequest(request, response);
        
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {
            redirectStratgy.sendRedirect(request, response, "index.do");
        }
        
    }


}
