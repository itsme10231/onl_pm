package com.nl.onl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.service.IScheduleService;
import com.nl.onl.service.IWantedService;

@Controller
public class ScheduleController {

	@Autowired
	private IScheduleService scheduleServiceImp;
	
	@Autowired
	private IWantedService wantedServiceImp;
	
	@RequestMapping(value = "/calendarform.do", method = RequestMethod.GET)
	public String calendarform(HttpServletRequest request){
		
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String date=request.getParameter("date");
		
		return "calendar";
	}
}
