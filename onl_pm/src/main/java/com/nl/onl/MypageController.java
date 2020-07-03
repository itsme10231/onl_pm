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
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.ChatlistDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.UserlistDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.service.IChatService;
import com.nl.onl.service.IMyPageService;
import com.nl.onl.util.Util;

@Controller
public class MypageController {
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	@Autowired
	IChatService chatServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mypage.do", method= {RequestMethod.GET})
	public String toMypage() {
		
		return "redirect:/mywanted.do";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mywanted.do", method= {RequestMethod.GET})
	public String myWanted(Model model, Authentication auth, String pnum, String sortType, String align, String state) {
		
		List<WantedDto> wlist = new ArrayList<>();
		
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);

		map.put("sortType", sortType);

//		map.put("align", align);
		map.put("state", state);
		
		wlist = myPageServiceImp.getAllMyList(map);
		model.addAttribute("wlist",wlist);

		
		
		System.out.println(wlist);
		
		int allP = myPageServiceImp.pcount(map);
//		System.out.println(allP);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		
		return "mywanted";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/myapply.do", method= {RequestMethod.GET})
	public String myApply(Model model, Authentication auth, String pnum, String sortType, String align, String state) {
		
		List<WantedDto> wlist = new ArrayList<>();
		
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);

		map.put("sortType", sortType);

//		map.put("align", align);
		map.put("state", state);
		
		wlist = myPageServiceImp.myApplyCount(map);
		model.addAttribute("wlist",wlist);

		
		
		System.out.println(wlist);
		
		int allP = myPageServiceImp.pcount(map);
//		System.out.println(allP);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		
		return "myapply";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/mychat.do", method= {RequestMethod.GET})
	public String myChatList(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		pnum = (pnum == null? "1":pnum);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pnum", pnum);
		
		List<ChatlistDto> clist = chatServiceImp.chatList(map);
		
		int allP = 0;
		if(clist != null && clist.size() != 0) {
			allP = clist.get(0).getResult_c();
		}
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		System.out.println(clist);
		model.addAttribute("clist", clist);
		
		return "chatlist";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/userlist.do", method= {RequestMethod.GET})
	public String myUserlist(Model model, Authentication auth, String pnum, String type) {
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		pnum = (pnum == null? "1":pnum);
		
		Map<String, String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pnum", pnum);
		map.put("type", type);
		
		List<UserlistDto> ulist = myPageServiceImp.getUserlist(map);
		System.out.println(ulist);
		
		model.addAttribute("ulist", ulist);
		model.addAttribute("pnum", pnum);
		
		int allP = myPageServiceImp.getUserlistCount(map);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		return "userlist";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value="/userlist.do", method= {RequestMethod.POST})
	@ResponseBody
	public String modifyUserlist(Model model, String seq, String type) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("seq", seq);
		
		if(type.equals("W")) {
			map.put("type", "B");
		}else {
			map.put("type", "W");
		}
		
		boolean isS = myPageServiceImp.changeUserlist(map);
		
		if(isS) {
			return "success";
		}else {
			return "fail";
		}
	}
}
