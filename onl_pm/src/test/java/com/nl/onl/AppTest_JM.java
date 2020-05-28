package com.nl.onl;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nl.onl.dtos.WantedDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/application-context.xml"})
public class AppTest_JM {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Test
	public void test() {
		System.out.println("test");
		Map<String, String> map = new HashMap<>();
		map.put("id", "onltest1");
		map.put("score", "80");

		
		List<WantedDto> list = sqlSession.selectList("com.nl.onl.wanted.getWantedListLogin", map);
		for(WantedDto wdto:list) {
			System.out.println(wdto);
		}
	}

}
