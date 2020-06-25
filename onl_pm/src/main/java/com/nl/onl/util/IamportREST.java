package com.nl.onl.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

public class IamportREST {
	
	private String imp_key;
	private String imp_secret;
	
	public String getImp_key() {
		return imp_key;
	}
	public void setImp_key(String imp_key) {
		this.imp_key = imp_key;
	}
	public String getImp_secret() {
		return imp_secret;
	}
	public void setImp_secret(String imp_secret) {
		this.imp_secret = imp_secret;
	}
	
	@Autowired
	Util onlUtil;
	
	public String getToken() throws UnsupportedEncodingException {
		String token = "";
		
		String url = "https://api.iamport.kr/users/getToken";
		String param = "imp_key="+imp_key +"&imp_secret=" +imp_secret;
		
		JSONObject jObj = onlUtil.connectUrl(url, param, "POST", null);
		
		return token;
	}
	
	public JSONObject isAbleAccount() {
		JSONObject jObj = null;
		
	
		
		
		
		return jObj;
	}
	
}
