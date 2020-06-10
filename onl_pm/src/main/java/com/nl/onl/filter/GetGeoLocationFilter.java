package com.nl.onl.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.util.Util;


@WebFilter("/GetGeoLocationFilter")
public class GetGeoLocationFilter implements Filter {
	
	@Autowired
	Util onlUtil;
	
    public GetGeoLocationFilter() {
    	
    }


	public void destroy() {
		
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if(request instanceof HttpServletRequest) {
			HttpServletRequest httpRequest = (HttpServletRequest)request;
			
//			Cookie geoCookie = onlUtil.getCookie("geoLocation", httpRequest);
//			
//			if(geoCookie == null || geoCookie.getValue() == null || geoCookie.getValue() == "") {
//				
//			}
			
			
			
		}
		
		
		
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {

	
	}

}
