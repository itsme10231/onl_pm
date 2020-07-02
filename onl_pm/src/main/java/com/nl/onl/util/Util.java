package com.nl.onl.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nl.onl.dtos.FileDto;



public class Util {
	
	private String accessKey;
	private String secretKey;
	
	private String filePath;
	
	
	public String getAccessKey() {
		return accessKey;
	}

	public void setAccessKey(String accessKey) {
		this.accessKey = accessKey;
	}

	public String getSecretKey() {
		return secretKey;
	}

	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	

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
	
	public String makeSignature(String url, String timestamp, String userIp) {
		
		
	    String space = " ";                    // one space
	    String newLine = "\n";                    // new line
	    String method = "GET";                    // method
//	    String url = "geolocation/v2/geoLocation?ip="+userIp;    // url (include query string)
//	    String timestamp = getTodayMill();            // current timestamp (epoch)
//	    String accessKey = ""   ;         // access key id (from portal or sub account)
//	    String secretKey = "";

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
//		    encodeBase64String = Base64.encodeBase64String(rawHmac);
		    
		    Encoder encoder = Base64.getEncoder();
		    
		    encodeBase64String = new String(encoder.encode(rawHmac));
		    
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
//		System.out.println(mills);
		String millS = String.valueOf(mills);
		
		return millS;
	}
	
	public JSONObject getCurrLocation(String ip) {
		StringBuffer result = new StringBuffer();
		JSONObject jObj = null;
		
		String url = "https://geolocation.apigw.ntruss.com";
		String requestUrl1 = "/geolocation/v2";
		String requestUrl2 = "/geoLocation";
		

		String timestamp = getTodayMill();

		
		String queries = "ip="+ip+"&enc=utf8&ext=t&responseFormatType=json";
		String signature = makeSignature(requestUrl1+requestUrl2+"?"+queries, timestamp, ip);
		
		String urlS = "https://geolocation.apigw.ntruss.com/geolocation/v2/geoLocation?"
				+queries
				;
		
		Map<String, String> map = new HashMap<>();
		map.put("x-ncp-apigw-timestamp", timestamp);
		map.put("x-ncp-iam-access-key", accessKey);
		map.put("x-ncp-apigw-signature-v2", signature);
		
		jObj = connectUrl(urlS, null, "GET", map);
			
		
		return jObj;
	}
	
	
	public String getRemoteAddr(HttpServletRequest request) {
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
        
//        System.out.println(ip);
        
        //로컬호스트에서 접속했을 경우
        if(ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:1")) {
        	
        	try {
				URL ipURL = new URL("http://ipinfo.io/ip");
				InputStream is = ipURL.openStream();
				InputStreamReader isr = new InputStreamReader(is);
				
				BufferedReader br = new BufferedReader(isr);
				
				
				ip = br.readLine();
//				System.out.println(ip);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
        }
        
        
        return ip;
    }

	
	public List<FileDto> letUpload(String boardType, MultipartFile[] files, String id){
		
		boolean isS = false;
		List<FileDto> flist = new ArrayList<>();
		if(files.length == 0) {
			isS = true;
		}else {
			for(MultipartFile file:files) {
				
				String originName = file.getOriginalFilename();
				
				if(originName == null || originName.equals("")) {
					//파일이름이 없을경우
					isS = true;
					break;
				}

				String creatUUID = UUID.randomUUID().toString().replaceAll("-", "");
				String storedName = creatUUID +originName.substring(originName.indexOf("."));
				
				
				File f = new File(filePath+storedName);
				
				try {
					
					file.transferTo(f);
					flist.add(new FileDto(0, originName, storedName, null, "N", boardType, id, 0));
					isS = true;
					
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					isS = false;
				}
				
			}
		}
		System.out.println(flist);
		return isS ? flist : null;
	}
	
	public Date toDate(String dateS) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date thisdate = null;
		try {
			thisdate = format.parse(dateS);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		return thisdate;
	}
	
	public String toDateString(Date date) {
		String s = "";
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		s = format.format(date);
		
		return s;
	}
	
	public JSONArray toJArr(List<? extends Object> list) {
		ObjectMapper mapper = new ObjectMapper();
		JSONParser parser = new JSONParser();
		JSONArray jArr = new JSONArray();
		
			try {
				for(int i = 0; i < list.size(); i++) {
					jArr.add(parser.parse(mapper.writeValueAsString(list.get(i))));
				}
			} catch (JsonProcessingException e) {

				e.printStackTrace();
			} catch (ParseException e) {

				e.printStackTrace();
			}	
		
		
		return jArr;
	}
	
	public Map<String, Integer> pagingValue(int count,String pnum,int pageRange){
		Map<String, Integer> map=new HashMap<String, Integer>();
		
		int pNumber=Integer.parseInt(pnum);
		//페이지들을 5개씩 페이징 처리를 위해
		//1234(5)   6789(10) : 페이지 번호를 받아 해당 페이지의 마지막 페이지 번호를 구함
		int pageEndNum=((pNumber-1)/pageRange+1)==1?pageRange:((pNumber-1)/pageRange+1)*pageRange;    
		
		int prePageNum=pageEndNum-pageRange==0?1:pageEndNum-pageRange;
		                                     //      10-5=5
		int nextPageNum=pageEndNum>=count?count:pageEndNum+1;
		//     현재페이지가 8일경우:  10   >=   14 ?   15  :  10+1   ---> 11
		//     현재페이지가 12일경우:  15   >=   14 ?   14  :  14+1   ---> 14   
		//   1 2 3 4 5 < 6 7 8 9 10 > 11 12 13 14 
		
		int startPage=pageEndNum-(pageRange-1);//현재페이지번호가 8일경우 10-(5-1)= 6
		int endPage=pageEndNum>count?count:pageEndNum;//
		
		map.put("prePageNum", prePageNum);
		map.put("nextPageNum", nextPageNum);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		
		return map;
	}
	
	//주소범위 가공 메서드
	public String makeLocRange(String location, String locrange) {
		String[] locs = location.split(" ");
		
		if(locrange.equals("l2")) {
			return locs[0];
		}else if(locrange.equals("l3")) {
			return locs[0] +" " +locs[1];
		}else if(locrange.equals("l4")){
			return locs[0] +" " +locs[1] +" " +locs[2];
		}else {
			
			String str = "";
			for(int i = 0; i < locs.length-1; i++) {
				str += locs[i];
				if(i != locs.length-2) {
					str += " ";
				}
			}
			return str;
		}
		
	}
	
	//rest api에 연결하여 값을 제이슨객체로 받아오는 메서드
	public JSONObject connectUrl(String url, String param, String method, Map<String, String> headerVal) {
		JSONObject jObj = null;
		StringBuffer result = new StringBuffer();
		
		try {
			URL urlObj = new URL(url);
			HttpURLConnection con = (HttpURLConnection)urlObj.openConnection();
			
			if(headerVal!= null && headerVal.size() != 0) {
				Set<String> keyset = headerVal.keySet();
				Iterator<String> it = keyset.iterator();
				
				while(it.hasNext()) {
					
					String key = it.next();
					con.setRequestProperty(key, headerVal.get(key));
				}
			}
			
			if(method.equals("POST")) {
				con.setRequestMethod(method);
				con.setDoOutput(true);
				con.setDoInput(true);
				con.setUseCaches(false);
				con.setDefaultUseCaches(false);
				
				OutputStream os = con.getOutputStream();
				os.write(param.getBytes());
				os.flush();
				os.close();
			}
			
			InputStream is = con.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			
			BufferedReader br = new BufferedReader(isr);
			
			String line;
			
			
			while((line = br.readLine()) != null) {
				result.append(line);
				result.append("\n");
			}
			System.out.println(result);
			JSONParser parser = new JSONParser();
			jObj = (JSONObject)parser.parse(result.toString());
			
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		return jObj;
	}
}
