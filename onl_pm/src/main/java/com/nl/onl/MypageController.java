package com.nl.onl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.service.IMyPageService;

@Controller
public class MypageController {
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mywanted.do", method= {RequestMethod.GET})
	public String writeProfileform(Model model, Authentication auth) {
		
		List<WantedDto> wlist = new ArrayList<>();
		
		if(auth != null && auth.isAuthenticated()) {
			LoginDto ldto = (LoginDto)auth.getPrincipal();
			String id = ldto.getId();
			String pnum = "1";
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pnum", pnum);
			
			wlist = myPageServiceImp.getAllMyList(map);
			model.addAttribute("wlist",wlist);
			System.out.println(wlist);
		}
		return "mywanted";
	}
}
