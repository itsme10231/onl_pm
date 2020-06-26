package com.nl.onl.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.dtos.AccountDto;
import com.nl.onl.service.IPaymentService;

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
	
	@Autowired
	IPaymentService paymentServiceImp;
	

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
	
	
	
	public boolean isRealAccount(String identity, String bankCode, String accountNum, String name) {
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
		jObj.put("bank_tran_id", "T991632680"+"U" +paymentServiceImp.getSequence());
		jObj.put("bank_code_std", bankCode);
		jObj.put("account_num", accountNum);
		jObj.put("account_holder_info", identity);
		jObj.put("account_holder_info_type", " ");
		jObj.put("tran_dtime", tran_dtime);
		
		String param = jObj.toJSONString();
		
		JSONObject result = onlUtil.connectUrl(url, param, "POST", headerVal);
		String acc_name = (result.get("account_holder_name") == null? "":(String)result.get("account_holder_name"));
		if(acc_name.equals(name)) {
			isS = true;
		}
		
		return isS;
	}
	
	//실제로 호출해서 사용하는 함수
	public JSONObject sendSalary(List<AccountDto> alist) {
		
		JSONObject result = new JSONObject();
		
		return sendSalary(alist, 0, result);
	}
	
	

	private JSONObject sendSalary(List<AccountDto> alist, int count_index, JSONObject result) {
//		boolean isS = false;
		
		List<AccountDto> asublist = null;
		
		if(alist.size() > 25) {
			asublist = new ArrayList<AccountDto>(alist.subList(25, alist.size()));
			alist = new ArrayList<AccountDto>(alist.subList(0, 25));
		}
		
		Date thisDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String tran_dtime = format.format(thisDate);
		
		String url = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/acnt_num";
		
		Map<String, String> headerVal = new HashMap<>();
		headerVal.put("Authorization", "Bearer " +getOnlToken());
		
		//이하 패러미터 셋팅
		JSONObject jObj = new JSONObject();
		
		jObj.put("cntr_account_type", "N");
		jObj.put("cntr_account_num", "2537935671");
		jObj.put("wd_pass_phrase", "NONE");
		jObj.put("wd_print_content", "ONL출금결제");
		jObj.put("req_cnt", alist.size()+"");
		jObj.put("tran_dtime", tran_dtime);
		
		JSONArray req_list = new JSONArray();
		for(int i = 0; i < alist.size(); i++) {
			
			JSONObject req = new JSONObject();
			req.put("tran_no", i+1+"");
			req.put("bank_tran_id", "T991632680"+"U" +paymentServiceImp.getSequence());
			req.put("bank_code_std", alist.get(i).getBank_code());
			req.put("account_num", alist.get(i).getAccount_number());
			req.put("account_holder_name", alist.get(i).getName());
			req.put("print_content", "ONL입금결제");
			req.put("tran_amt", alist.get(i).getTran_amt());
			req.put("req_client_name", "ONL");
			req.put("req_client_bank_code", "020");
			req.put("req_client_account_num", "1002938872551");
			req.put("req_client_num", "FFF000");
			req.put("transfer_purpose", "TR");
			
			req_list.add(req);
		}

		
		jObj.put("req_list", req_list);
		
		
		String param = jObj.toJSONString();
		System.out.println(param);
		JSONObject thisR = onlUtil.connectUrl(url, param, "POST", headerVal);
		result.put(count_index+"", thisR);
		
		if(asublist!= null) {
			sendSalary(asublist, count_index+1, result);
		}
		
		return result;
	}
	
	

}
