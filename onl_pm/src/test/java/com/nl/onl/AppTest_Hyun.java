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

import com.nl.onl.dtos.QnaDto;
import com.nl.onl.dtos.WantedDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/application-context.xml"})
public class AppTest_Hyun {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Test
	public void test2() {
		
		
		System.out.println("Test");
		System.out.println("sqlSession: " +sqlSession);
		
//		int seq=1;
//		List<QnaDto> list = sqlSession.selectOne("com.nl.onl.custom.deleteQna",seq);

		
//		List<QnaDto> list = sqlSession.selectList("com.nl.onl.custom.getAllListQna","1");
//		List<QnaDto> list = sqlSession.selectOne("com.nl.onl.admin.pcountReport");
//		int pcount = sqlSession.selectOne("com.nl.onl.admin.pcountReport");
		
		
		
//		for(WantedDto wdto:list) {
//			System.out.println(wdto);
//		}
//
//		
//		
		Map<String, String> map=new HashMap<>();
		map.put("process", "COMPLETE");
		map.put("seq", "2");
		sqlSession.selectList("com.nl.onl.admin.updateReport", map);
//		
//		List<WantedDto> wdto2 = sqlSession.selectList("com.nl.onl.myPage.applyList", map);
//		
//		for(WantedDto wdto:wdto2) {
//			System.out.println(wdto2);
//		}
	}
	
}
