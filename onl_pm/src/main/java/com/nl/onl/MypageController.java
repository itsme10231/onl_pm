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
import com.nl.onl.util.Util;

@Controller
public class MypageController {
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mywanted.do", method= {RequestMethod.GET})
	public String writeProfileform(Model model, Authentication auth, String pnum, String sortType, String aling, String regdate) {
		
		List<WantedDto> wlist = new ArrayList<>();
		
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);
		
		
		wlist = myPageServiceImp.getAllMyList(map);
		model.addAttribute("wlist",wlist);
		model.addAttribute("sortType", sortType);
		model.addAttribute("regdate",regdate);
		map.put("sortType", sortType);
		map.put("aling", aling);
		
		
		int allP = myPageServiceImp.pcount(id);
//		System.out.println(allP);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		
		return "mywanted";
	}
}
