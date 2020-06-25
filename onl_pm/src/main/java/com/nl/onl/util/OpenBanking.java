package com.nl.onl.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

public class OpenBanking {
	
	private String client_id;
	private String secret_key;
	
	
	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getSecret_key() {
		return secret_key;
	}

	public void setSecret_key(String secret_key) {
		this.secret_key = secret_key;
	}

	
	@Autowired
	Util onlUtil;
	

	public String getOnlToken() {
		//오픈뱅킹의 2-legged 인증을 실시합니다.
		
		String token = "";

		String url = "https://testapi.openbanking.or.kr/oauth/2.0/token"; 
		String param = "client_id=" 
						+client_id
						+"&client_secret="
						+secret_key
						+"&scope=oob&grant_type=client_credentials";
		
		token = (String)onlUtil.connectUrl(url, param, "POST", null).get("access_token");
//		System.out.println(token);
		
		return token;
	}
	
	
	
	public boolean isRealAccount(String identity, String bankCode, String accountNum) {
		boolean isS = false;
		
		Date thisDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String tran_dtime = format.format(thisDate);
		
		accountNum = accountNum.replace("-", "");					 
		Map<String, String> headerVal = new HashMap<>();
		headerVal.put("Authorization", "Bearer " +getOnlToken());
		
		String url = "https://testapi.openbanking.or.kr/v2.0/inquiry/real_name";
//		String param = "bank_code_std=" +bankCode
//						 +"&account_num=" +accountNum
//						 +"&account_holder_info_type=1"
//						 +"&account_holder_info=" +identity
//						 +"&tran_dtime=" +tran_dtime;
//		
		JSONObject jObj = new JSONObject();
		jObj.put("bank_tran_id", "T991632680U4BC34229Z");
		jObj.put("bank_code_std", bankCode);
		jObj.put("account_num", accountNum);
		jObj.put("account_holder_info", identity);
		jObj.put("account_holder_info_type", " ");
		jObj.put("tran_dtime", tran_dtime);
		
		String param = jObj.toJSONString();
		
		JSONObject result = onlUtil.connectUrl(url, param, "POST", headerVal);
		System.out.println(result);
		
		return isS;
	}
	
	
	
	public boolean sendSalary() {
		boolean isS = false;
		
		
		
		return isS;
	}
	
	

}
