package com.nl.onl;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.WantedDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/application-context.xml"})
public class AppTest_tae {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Test
	public void test1() {
		
		
//		System.out.println("Test");
//		System.out.println("sqlSession: " +sqlSession);
		
		String id = "onltest1";
		List<WantedDto> list = sqlSession.selectList("com.nl.onl.schedule.worked", id);
		
		for(WantedDto wdto:list) {
			System.out.println("1. "+wdto);
		}
	}
	@Test
	public void test2() {
		
		String id = "onltest1";
		List<WantedDto> list = sqlSession.selectList("com.nl.onl.myPage.detail", id);
		
		for(WantedDto wdto:list) {
			System.out.println("2. "+wdto);
		}
	}
	@Test
	public void test3() {	
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", "onltest1");
		map.put("pnum", "1");
		sqlSession.selectList("com.nl.onl.myPage.getAllMyList", map);
		
		List<WantedDto> wdto3 = sqlSession.selectList("com.nl.onl.myPage.getAllMyList", map);
		
		for(WantedDto wdto:wdto3) {
			System.out.println("3. "+wdto);
		}
	}	
	
	@Test
	public void test4() {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("selector", 1);
		map.put("seq", 1);
		
		List<WantedDto> wdto4 = sqlSession.selectList("com.nl.onl.myPage.selector", map);
		
		for(WantedDto wdto:wdto4) {
			System.out.println("4. "+wdto);
		}
	}
	
	@Test
	public void test5() {
		Map<String, String> map=new HashMap<String, String>();
		map.put("id", "onltest1");
		map.put("type", "SEARCH");
		map.put("pnum", "1");
		
		List<ReviewDto> wdto5 = sqlSession.selectList("com.nl.onl.myPage.getReview", map);
		
		for(ReviewDto wdto:wdto5) {
			System.out.println("5. "+wdto);
		}
	}
	@Test
	public void test6() {
		
		int pcount = sqlSession.selectOne("com.nl.onl.myPage.pcount");
		
		System.out.println("6." +pcount);
		
//		for(WantedDto wdto:wdto6) {
//			System.out.println("6. "+wdto);
//		}
	}
}
