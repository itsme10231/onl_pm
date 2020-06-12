package com.nl.onl;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.nl.onl.daos.ILoginDao;
import com.nl.onl.daos.IWantedDao;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.security.OnlAuthProvider;
import com.nl.onl.service.ILoginService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/**"})
@WebAppConfiguration
public class AppTest {
	
//	@Autowired
//	UserDetailsService loginServiceImp;
	
//	@Autowired
//	ILoginService loginServiceImp;
	
	@Autowired
	IWantedService wantedServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Test
	public void test() throws ParseException {
		
//		LoginDto ldto = new LoginDto(null, "admin", "관리자", "서울", "강서구", "어디", "admin", null, null, null, null, "ADMIN", "010-000-0000", "O");
//		loginServiceImp.insertMember(ldto);
		System.out.println("test");
		
		List<FileDto> flist = new ArrayList<>();
		flist.add(new FileDto(0,"service_1.jpg","service_1.jpg",null,"N","WANTED_POST","O0",0));
		
//		wantedServiceImp.insertWantedT(new WantedDto("O0",105,"애견 호텔링 구함",onlUtil.toDate("2020-07-12"),"20200812","20200813",1141011400,"0330","0430",1800,"테스트용","Y010-000-0000","Y","우리집"), flist);
//		wantedServiceImp.getWantedDetailT("46");
		
		Map<String, String> map = new HashMap<>();
		map.put("id", "O1");
		map.put("seq", "46");
		
		WantedDto wdto = wantedServiceImp.getWantedDetailLoginT(map);
		System.out.println(wdto);
//		u.getCurrLocation();
	}
	
}
