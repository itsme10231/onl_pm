package com.nl.onl;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.service.IWantedService;

@Controller
public class PageController {
	
	@Autowired
	IWantedService wantedServiceImp;
	
	
}
