package com.nl.onl;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
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
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.security.OnlAuthProvider;
import com.nl.onl.service.ILoginService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/**"})
@WebAppConfiguration
public class AppTest {
	
//	@Autowired
//	UserDetailsService loginServiceImp;
	
	@Autowired
	ILoginService loginServiceImp;
	
	@Test
	public void test() {
		
//		LoginDto ldto = new LoginDto(null, "admin", "관리자", "서울", "강서구", "어디", "admin", null, null, null, null, "ADMIN", "010-000-0000", "O");
//		loginServiceImp.insertMember(ldto);
		System.out.println("test");
	}
	
}
