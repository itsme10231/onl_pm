package com.nl.onl.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;

public class ScheduleDate {

	private String toDates;
	
	public void setToDates(String mDate) {
		String m=mDate.substring(0,4)+"-"+
				mDate.substring(4,6)+"-"+
				mDate.substring(6,8)+" "+
				mDate.substring(8,10)+":"+
				mDate.substring(10)+":00";
		
		Timestamp tm = Timestamp.valueOf(m);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		
		this.toDates = sdf.format(tm);
	}

	public String getToDates() {
		return this.toDates;
	}
	
	public static String isTwo(String s) {
		return s.length()<2?"0"+s:s;
	}
	
	public static String fontColor(int dayOfWeek, int i) {
		String color="";
		
		if((dayOfWeek-1+i)%7==0) {
			color="blue";
		}else if((dayOfWeek-1+i)%7==1) {
			color="red";
		}else {
			color="black";
		}
		return color;
	}
	
	

}
