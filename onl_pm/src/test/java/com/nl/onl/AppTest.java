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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nl.onl.daos.ILoginDao;
import com.nl.onl.daos.IWantedDao;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.security.OnlAuthProvider;
import com.nl.onl.service.ILoginService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.FileWrite;
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
	public void test() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String s = mapper.writeValueAsString(wantedServiceImp.getCategory());
		
		FileWrite writer = new FileWrite();
		
		writer.writeFile("D:\\onl_pm\\onl_pm\\src\\main\\webapp\\resources\\common\\category.json", s);
	}
	
}
