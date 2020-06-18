package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.service.IScheduleService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.Util;

@Controller
public class ScheduleController {

	@Autowired
	private IScheduleService scheduleServiceImp;
	
	@Autowired
	private IWantedService wantedServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@RequestMapping(value = "/calendarform.do", method = RequestMethod.GET)
	public String calendarform(Model model, String year, String month, String date, Authentication auth, String seq){
		
		if(auth!=null && auth.isAuthenticated()) {
			LoginDto ldto=(LoginDto)auth.getPrincipal();
			String id=ldto.getId();
			
			Map<String, String> map=new HashMap<>();
			map.put("id", id);
			
			List<WantedDto> wlist=wantedServiceImp.getWantedDetailLoginT(map);
			model.addAttribute("wlist",wlist);
			System.out.println(wlist);
			
			
		}else {
			List<WantedDto> wlist=wantedServiceImp.getWantedDetailT(seq);
			model.addAttribute("wlist", wlist);
		}
		return "calendar";
	}
}
