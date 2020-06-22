package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;
import com.nl.onl.service.IChatService;
import com.nl.onl.util.Util;

@Controller
public class SocketController {
	
	@Autowired
	IChatService chatServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String toChatPage() {
		
		return "chat";
	}
	
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	@RequestMapping(value = "/getMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public JSONArray getMessage(Authentication auth, String target_id, String wanted_seq) {
		JSONArray jArr = null;
		Map<String, String> map = new HashMap<>();
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		
		map.put("id", ldto.getId());
		map.put("target_id", target_id);
		map.put("wanted_seq", wanted_seq);
		List<ChatDto> clist = chatServiceImp.getMessageT(map);
		System.out.println("clist: " +clist);
		jArr = onlUtil.toJArr(clist);
		
		return jArr;
	}
	
	
}
