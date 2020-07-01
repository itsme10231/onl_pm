package com.nl.onl.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
	
	public String getToken(){
		String token = "";
		
		String url = "https://api.iamport.kr/users/getToken";
		String param = "imp_key="+imp_key +"&imp_secret=" +imp_secret;
		
		JSONObject jObj = onlUtil.connectUrl(url, param, "POST", null);
		
		String res = jObj.get("response").toString();
		JSONParser parser = new JSONParser();
		try {
			jObj = (JSONObject) parser.parse(res);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		token = (String)jObj.get("access_token");
		System.out.println(token);
		
		return token;
	}
	
	
	public boolean getRefund(String imp_uid, String merchant_uid, String reason) {
		boolean isS=false;
		JSONObject jObj = null;

		String url = "https://api.iamport.kr/payments/cancel";
		String param = "imp_uid=" +imp_uid
						+"&merchant_uid=" +merchant_uid
						+"&reason=" +reason
				;
		
		Map<String, String> headerVal = new HashMap<>();
		headerVal.put("Authorization", getToken());
		
		jObj = onlUtil.connectUrl(url, param, "POST", headerVal);
		Object code = jObj.get("code"); 
		long temp = 0;
		
		if(code!=null) {
			if((Long)code==temp) {
				isS = true;
			}
		}else {
			isS= false;
		}
		
		return isS;
	}
	
}
