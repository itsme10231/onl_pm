package com.nl.onl;

import java.util.ArrayList;
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

import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;
import com.nl.onl.service.IMyPageService;
import com.nl.onl.service.IWantedService;

@Controller
public class WantedController {
	
	@Autowired
	IWantedService wantedServiceImp;
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	//구인글 검색
	@RequestMapping(value="search.do", method=RequestMethod.GET)
	public String searchWanted(Model model, SearchDto sdto, Authentication auth) {
		
		List<WantedDto> wlist = new ArrayList<>(); 
		
		if(sdto.getPnum() == null) {
			sdto.setPnum("1");
		}
		
		if(auth.isAuthenticated()) {
			wantedServiceImp.getWantedListLogin(sdto);
		}else {
			wantedServiceImp.getWantedList(sdto);
		}
		
		model.addAttribute(wlist);
		return "wantedlist";
	}
	
	//구인글 상세보기
	@RequestMapping(value="wanted.do", method=RequestMethod.GET)
	public String getWantedDetail(Model model, Authentication auth, String seq) {
		System.out.println(auth == null? true: false);
		
		if(seq == null) {
			seq = "0";
		}
		
		if(auth != null && auth.isAuthenticated()) {
			LoginDto ldto = (LoginDto)auth.getPrincipal();
			String id = ldto.getId();
			
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("seq", seq);
			
			WantedDto wdto = wantedServiceImp.getWantedDetailLogin(map);
			model.addAttribute(wdto);
		
		}else{
			
			WantedDto wdto = wantedServiceImp.getWantedDetail(seq);
			model.addAttribute(wdto);
			
		}
		
		return "wanteddetail";
	}
	
	@RequestMapping(value="/getcategory.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray getCategory(Model model) {
		
		List<CategoryDto> clist = wantedServiceImp.getCategory();
		
		JSONArray cArray = new JSONArray();
		
		for(CategoryDto cdto:clist) {
			cArray.add(cdto);
		}
		

		return cArray;
	}
	
	//미사용
//	@RequestMapping(value="category.do", method=RequestMethod.GET)
//	public String getListByCategory(Model model) {
//		
//		return "wantedlist";
//	}
	
//	@Secured({"ROLE_USER"})
	@RequestMapping(value="writewantedform.do", method=RequestMethod.GET)
	public String writeWantedForm(Model model, Authentication auth) {
		
		
		return "wantedform";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="writewanted.do", method=RequestMethod.POST)
	public String writeWanted(Model model, WantedDto wdto, Authentication auth, String telpub) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		wdto.setNickname(ldto.getNickname());
		wdto.setId(ldto.getId());
		wdto.setPhone(telpub+ldto.getPhone());
		
		wantedServiceImp.insertWanted(wdto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="addwish.do", method=RequestMethod.POST)
	@ResponseBody
	public String addWish(Model model, Authentication auth, String seq) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		WishDto wdto = new WishDto(0, ldto.getId(), Integer.parseInt(seq));

		if(wantedServiceImp.insertWish(wdto)) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value="delwish.do", method=RequestMethod.POST)
	@ResponseBody
	public String delWish(Model model, Authentication auth, String seq) {
		
		

		if(myPageServiceImp.delWishlist(seq)) {
			return "success";
		}else {
			return "fail";
		}
		
	}
}
