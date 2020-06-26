package com.nl.onl.util;

import java.io.Console;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;

import com.nl.onl.dtos.WantedDto;

import net.bytebuddy.dynamic.scaffold.MethodRegistry.Handler.ForAbstractMethod;

public class ScheduleDate {

	private String toDates;
	private List<WantedDto> wlist;
	private int date;
	private String calViewList;
	private int month;

	

	public void setToDates(String mDate) {
		String m=mDate.substring(0,4)+"-"+
				mDate.substring(4,6)+"-"+
				mDate.substring(6)+" ";
//				mDate.substring(8,10)+":"+
//				mDate.substring(10)+":00"; 
		
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
	

	public void setWlist(List<WantedDto> wlist) {
		this.wlist = wlist;
	}

	public void setDate(int date) {
		this.date = date;
	}


	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getCalViewList() {
		String d=isTwo(this.date+""); //1일 --> "01"변환  --> "01" != "1" 이런 상황에 대비
		String titleList=""; //달력에서 일정을 출력해줄 문자열 --> "<p>title</p><p>title</p><p>title</p>"
		String m=isTwo(this.month+"");
//		String i=m+d;
		
		Calendar cal=Calendar.getInstance();
		cal.get(Calendar.YEAR);
		cal.get(Calendar.MONTH);
		cal.get(Calendar.DATE);
		
		String md=m+d;//"0601"
		
		for (int i=0;i<wlist.size();i++) {
			WantedDto wDto=wlist.get(i);
			if(Integer.parseInt(wDto.getSdate().substring(4, 8))<=Integer.parseInt(md) && Integer.parseInt(wDto.getEdate().substring(4, 8))>=Integer.parseInt(md)) {
				if(wDto.getSdate().substring(4, 8).equals(wDto.getEdate().substring(4, 8))) {
				titleList+="<p class='one'>"
						+("하나만 "+wDto.getTitle())
						+"</p>";
				}else {
					titleList+="<p class='end_"+wDto.getSeq()+"_o'>"
							+(wDto.getTitle()+":"+wDto.getSeq())
							+"</p><br>";
				}
			}
		}
		
//		for (WantedDto wDto : this.wlist) {
////			System.out.println(wDto.getSdate().substring(4, 6));
//			if(wDto.getSdate().substring(4,8).equals(wDto.getEdate().substring(4,8))) {
//				if(wDto.getSdate().substring(6, 8).equals(d) && wDto.getSdate().substring(4,6).equals(m)) {
//					titleList+="<p class='one'>"
//							+("하나만 "+wDto.getTitle()+" seq:"+wDto.getSeq())
//							+"</p>";
//					
//				}
//			}else {
			
//				if(wDto.getSdate().substring(6, 8).equals(d) && wDto.getSdate().substring(4,6).equals(m)) {
//					titleList+="<p class='start_"+wDto.getSeq()+"_p'>"
//						 +("시작 "+wDto.getTitle())
//						 +"</p><br>";
//				}
//				if(wDto.getEdate().substring(6, 8).equals(d) && wDto.getEdate().substring(4,6).equals(m)) {
//					titleList+="<p class='end_"+wDto.getSeq()+"_o'>"
//							 +("종료 "+wDto.getTitle())
//							 +"</p><br>";
//				}
//			}	
//		}
		
		this.calViewList=titleList;
		
		return this.calViewList;
	}
	
	//톰켓 구동 시 메서드 자동실행
	@PostConstruct
	public void scheduleSet() throws Exception {
		
		
		//jobDetatil 설정
		MethodInvokingJobDetailFactoryBean jobDetailBean = new MethodInvokingJobDetailFactoryBean();
		jobDetailBean.setTargetObject(new ScheduleDate());
		jobDetailBean.setTargetMethod("scheduleSet");
		jobDetailBean.setGroup("test");
		jobDetailBean.setName("scheduleSet");
		jobDetailBean.afterPropertiesSet();
		
		//cronTriger 설정
		CronTriggerFactoryBean cronTrigger = new CronTriggerFactoryBean();
		cronTrigger.setJobDetail((JobDetail)jobDetailBean.getObject());
		cronTrigger.setCronExpression("1****?");
		cronTrigger.setName("scheduleSet");
		
		Scheduler sch=new StdSchedulerFactory().getScheduler();
		sch.scheduleJob((JobDetail)jobDetailBean.getObject(),(Trigger) cronTrigger);
		sch.start();
	}
	public void scheduleStart() {
		
	}

	
	
	
	
	
	
	
	
	
	
	
//	public static String getCalView(List<WantedDto> list, int i) {
//		//list에 저장된 mdate는 "202004010900"
//		String d=isTwo(i+""); //1일 --> "01"변환  --> "01" != "1" 이런 상황에 대비
//		String titleList=""; //달력에서 일정을 출력해줄 문자열 --> "<p>title</p><p>title</p><p>title</p>"
//	
//		for (WantedDto wDto : list) {
//			if(wDto.getSdate().substring(6, 8).equals(d)) {
//				titleList+="<p class='clist'>"
//						 +(wDto.getTitle().length()>6?wDto.getTitle().substring(0, 6)+"...":wDto.getTitle())
//						 +"</p>";
//			}
//		}
//		
//		return titleList;
//	}

}
