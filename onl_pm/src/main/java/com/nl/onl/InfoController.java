package com.nl.onl;

import static org.junit.Assert.assertNotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;
import com.nl.onl.service.ILoginService;
import com.nl.onl.service.IPaymentService;

@Controller
public class InfoController {
	
	@Autowired
	ILoginService loginServiceImp;
	
	@Autowired
	IPaymentService paymentServiceImp;
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/memberinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String toMemeberInfo() {
		
		return "redirect:/memberinfo.do";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberInfo(Model model, Authentication auth) {
		
		
		return "memberinfo";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myProfile(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		ProfileDto pdto = loginServiceImp.getProfile(id);
		
		model.addAttribute("pdto", pdto);
		
		return "myprofile";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myaccount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myAccount(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		AccountDto adto = null;
		
		if(ldto.getHasacc().equals("Y")) {
			adto = paymentServiceImp.getAccount(id);
		}
		
		model.addAttribute("adto", adto);
		
		return "myaccount";
	}
}
