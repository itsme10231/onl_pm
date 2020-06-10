package com.nl.onl.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;


import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



public class Util {
	
	
	public Cookie getCookie(String cookieName, HttpServletRequest request) {
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals(cookieName)) {
				cookie = cookies[i];
			}
		}
		return cookie;
	}
	
	public void setCookie(String cookieName, String value, HttpServletResponse response) {
		Cookie cookie = new Cookie(cookieName, value);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
	}
	

	public String random() {
		
		int ran;
		String dom ="";
		ran = (int) (Math.random()*10);
		
			for (int i = 0; i < 6; i++) {
				dom+=(int) (Math.random()*10);
			}
			
		return dom;
	}
	
	public String makeSignature(String url, String accessKey, String timestamp, String userIp) {
		
		
	    String space = " ";                    // one space
	    String newLine = "\n";                    // new line
	    String method = "GET";                    // method
//	    String url = "geolocation/v2/geoLocation?ip="+userIp;    // url (include query string)
//	    String timestamp = getTodayMill();            // current timestamp (epoch)
//	    String accessKey = ""   ;         // access key id (from portal or sub account)
	    String secretKey = "zJL1YbqGV9dUxi2Tk3wCt31nstQ5Vj8iSrBnPYzk";

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String = "";
	    
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
		    mac.init(signingKey);
		    byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.encodeBase64String(rawHmac);
		    
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		}
	    
	  return encodeBase64String;
	}
	
	
	public String getTodayMill() {
		long mills = System.currentTimeMillis();
		System.out.println(mills);
		String millS = String.valueOf(mills);
		
		return millS;
	}
	
	public JSONObject getCurrLocation(String ip) {
		StringBuffer result = new StringBuffer();
		JSONObject jObj = null;
		
		String url = "https://geolocation.apigw.ntruss.com";
		String requestUrl1 = "/geolocation/v2";
		String requestUrl2 = "/geoLocation";
		
		String accessKey = "vQXABY1T2mnBqEJXJhcZ";
		String timestamp = getTodayMill();
//		String userIp = "112.221.224.125";
		
		String queries = "ip="+ip+"&enc=utf8&ext=t&responseFormatType=json";
		String signature = makeSignature(requestUrl1+requestUrl2+"?"+queries, accessKey, timestamp, ip);
		
		String urlS = "https://geolocation.apigw.ntruss.com/geolocation/v2/geoLocation?"
				+queries
				;
		
		try {
			
			
			URL urlObj = new URL(urlS);
			HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
//			con.setRequestMethod("GET");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2", signature);
			
//			con.connect();
			
			InputStream is = con.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			
			BufferedReader br = new BufferedReader(isr);
			
			String line;
			
			
			while((line = br.readLine()) != null) {
				result.append(line);
				result.append("\n");
			}
			System.out.println(result);
			
			//받아온 결과값을 제이슨 오브젝트로 가공
			JSONParser parser = new JSONParser();
			jObj = (JSONObject)parser.parse(result.toString());
			
			System.out.println(jObj.get("geoLocation"));
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		return jObj;
	}
	
	
	public static String getRemoteAddr(HttpServletRequest request) {
        String ip = null;
        ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("Proxy-Client-IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("WL-Proxy-Client-IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_CLIENT_IP"); 
        } 
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-Real-IP"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-RealIP"); 
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getRemoteAddr(); 
        }
        return ip;
    }
}
