package com.nl.onl.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nl.onl.util.Util;

public class GeoInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	Util onlUtil;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Cookie addressCookie = onlUtil.getCookie("addressCookie", request);
		
		String currIp = onlUtil.getRemoteAddr(request);
		
		if(addressCookie == null || !addressCookie.getValue().equals(currIp) ) {
			JSONObject gObj = onlUtil.getCurrLocation(currIp);
			JSONObject gObj2 = (JSONObject)gObj.get("geoLocation");
			
			String addr = gObj2.get("r1").toString() +" " +gObj2.get("r2").toString() +" " +gObj2.get("r3").toString();
			
			
			onlUtil.setCookie("addressCookie", currIp, response);
			onlUtil.setCookie("locationCookie", addr, response);
		}
		
		
		return super.preHandle(request, response, handler);
	}
}
