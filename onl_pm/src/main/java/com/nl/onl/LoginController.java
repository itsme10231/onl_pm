package com.nl.onl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.service.ILoginService;

@Controller
public class LoginController {
	
	@Autowired
	private ILoginService loginServiceImp;
	
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(Model model, String id, String pw) {
		
		
		
		return "home";
	}
}
