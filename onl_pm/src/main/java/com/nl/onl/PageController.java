package com.nl.onl;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.service.IWantedService;

@Controller
public class PageController {
	
	@Autowired
	IWantedService wantedServiceImp;
	
	@RequestMapping(value="/getcategory.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray getCategory(Model model) {
		
		List<CategoryDto> clist = wantedServiceImp.getCategory();
		
		JSONArray cArray = new JSONArray();
		ObjectMapper om = new ObjectMapper();
		
		for(CategoryDto cdto:clist) {
			cArray.add(cdto);
		}
		

		return cArray;
	}
	
	@RequestMapping(value="category.do", method=RequestMethod.GET)
	public String getListByCategory(Model model) {
		
		return "wantedlist";
	}
}
