package com.nl.onl;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;
import com.nl.onl.service.IAdminService;
import com.nl.onl.util.Util;

@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@RequestMapping(value = "/doreport.do", method = RequestMethod.POST)
	@ResponseBody
	@Secured("ROLE_USER")
	public String insertReport(Model model, ReportDto rdto, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		rdto.setId(ldto.getId());
		
		boolean isS = adminServiceImp.insertReport(rdto);
		
		if(isS) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value = "/getreportc.do", method = RequestMethod.POST)
	@ResponseBody
	@Secured("ROLE_USER")
	public JSONArray getReportCateogry() {
		
		List<ReportDto> rlist = adminServiceImp.getReportCategory();
		
		JSONArray jArr = null;
		
		if(rlist != null && rlist.size() != 0) {
			jArr = onlUtil.toJArr(rlist);
		}
		
		return jArr;
	}
}
