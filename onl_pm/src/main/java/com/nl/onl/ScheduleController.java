package com.nl.onl;

import java.time.DayOfWeek;
import java.util.Calendar;
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

import com.nl.onl.daos.ScheduleDaoImp;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.service.IScheduleService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.ScheduleDate;
import com.nl.onl.util.Util;

@Controller
public class ScheduleController {

	@Autowired
	private IScheduleService scheduleServiceImp;
	
	@Autowired
	private IWantedService wantedServiceImp;
	
	@Autowired
	Util onlUtil;

	
	
//	@RequestMapping(value = "/member/calendarform.do", method = RequestMethod.GET)
//	public String calendarform(Model model, String year, String month, String date, Authentication auth ){
//		
//		LoginDto ldto=(LoginDto)auth.getPrincipal();
//		String id=ldto.getId();
//		
//		month = ScheduleDate.isTwo(month);
//		
//		Map<String, String> map = new HashMap<>();
//		map.put("id", id);
//		map.put("yyyyMM", year+month);
//		List<WantedDto> slist = scheduleServiceImp.worked(map);
//		model.addAttribute("id",id);
//		model.addAttribute("slist",slist);
//		
//		return "calendar";
//	}
	
	@RequestMapping(value = "/member/calendarform.do", method = RequestMethod.GET)
	public String calendarform(Model model, String date, Authentication auth, HttpServletRequest request){
		
		LoginDto ldto=(LoginDto)auth.getPrincipal();
		String id=ldto.getId();
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH)+1;
		int day = cal.get(cal.DATE);
		int year2 = cal.get(cal.YEAR);
		int month2 = cal.get(cal.MONTH)+1;
		
		String pYear=request.getParameter("year");
	 	String pMonth=request.getParameter("month");
		
	 	if(pYear!=null){
 		year=Integer.parseInt(pYear);
		}
		if(pMonth!=null){
			month=Integer.parseInt(pMonth);
		}
		
		if(month>12){
			month=1;
			year++;
		}
		if(month<1){
			month=12;
			year--;
		}
		
		cal.set(year, month-1, 1);
		int dayOfWeek = cal.get(cal.DAY_OF_WEEK);
		int lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
		int nbsp = (7-(dayOfWeek-1+lastDay)%7)%7;
		
		cal.set(year, month-2, 1);
		int lastDay2 = cal.getActualMaximum(cal.DAY_OF_MONTH);
	
	 	String yyyyMM=year+ScheduleDate.isTwo(month+""); //yyyyMM 6자리로 변환

		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("yyyyMM", yyyyMM);
		
		
		List<WantedDto> slist = scheduleServiceImp.worked(map);
		List<WantedDto> wlist = scheduleServiceImp.working(map);
		List<WantedDto> alist = scheduleServiceImp.plan(map);
		
//		System.out.println(slist);
		model.addAttribute("id",id);
		model.addAttribute("slist",slist);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("dayOfWeek", dayOfWeek);
		model.addAttribute("year2", year2);
		model.addAttribute("month2", month2);
		model.addAttribute("lastDay2", lastDay2);
		model.addAttribute("wlist", wlist);
		model.addAttribute("alist", alist);

//		System.out.println(calV);
	
		
		
//		month = ScheduleDate.isTwo(month);
		
		
		
		
		
		
		return "calendar";
	}
}
