package com.nl.onl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.service.ICustomService;

@Controller
public class CustomerController {
	
	@Autowired
	ICustomService CustomServiceImp;
	
	@RequestMapping(value="getAllListQna.do", method=RequestMethod.GET)
	public String getListByCategory(Model model) {
		
		return "qnalist";
	}
	
}
