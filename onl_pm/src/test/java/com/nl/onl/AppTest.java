package com.nl.onl;

import static org.junit.Assert.*;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nl.onl.daos.ILoginDao;
import com.nl.onl.daos.IWantedDao;
import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.security.OnlAuthProvider;
import com.nl.onl.service.IAdminService;
import com.nl.onl.service.ILoginService;
import com.nl.onl.service.IPaymentService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.ChatRoom;
import com.nl.onl.util.FileWrite;
import com.nl.onl.util.IamportREST;
import com.nl.onl.util.OpenBanking;
import com.nl.onl.util.Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/**"})
@WebAppConfiguration
public class AppTest {
	
	@Autowired
	IWantedService wantedServiceImp;
	
//	@Autowired
//	ILoginService loginServiceImp;
	
	@Autowired
	IPaymentService paymentServiceImp;
	
	@Autowired
	OpenBanking openBanking;
	
	@Autowired
	Util onlUtil;
	
	@Test
	public void test() throws UnsupportedEncodingException {
//		ReportDto rdto = new ReportDto(0, "O1", "O0", "1", null, null, null, "-_-");

		SearchDto sdto = new SearchDto();
		sdto.setPnum("1");
		sdto.setTitle("코");
		sdto.setId("onltest1");
		System.out.println(wantedServiceImp.getWantedListLogin(sdto));
	}
	
}
