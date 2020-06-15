package com.nl.onl;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.service.IMyPageService;

@Controller
public class MypageController {
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	
	
}
