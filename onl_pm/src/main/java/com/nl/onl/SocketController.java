package com.nl.onl;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;

@Controller
public class SocketController {
	
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String toChatPage() {
		
		return "chat";
	}
	
}
