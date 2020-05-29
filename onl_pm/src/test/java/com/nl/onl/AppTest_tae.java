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

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.WantedDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/application-context.xml"})
public class AppTest_tae {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	마이페이지 테스트
//	@Test
//	public void test1() {
//		
//		
////		System.out.println("Test");
////		System.out.println("sqlSession: " +sqlSession);
//		
//		String id = "onltest1";
//		List<WantedDto> list = sqlSession.selectList("com.nl.onl.schedule.worked", id);
//		
//		for(WantedDto wdto:list) {
//			System.out.println("1. "+wdto);
//		}
//	}
//	
//	@Test
//	public void test2() {
//		
//		String id = "onltest1";
//		List<WantedDto> list = sqlSession.selectList("com.nl.onl.myPage.detail", id);
//		
//		for(WantedDto wdto:list) {
//			System.out.println("2. "+wdto);
//		}
//	}
//	
//	@Test
//	public void test3() {	
//		Map<String, String> map=new HashMap<String, String>();
//		map.put("id", "onltest1");
//		map.put("pnum", "1");
//		sqlSession.selectList("com.nl.onl.myPage.getAllMyList", map);
//		
//		List<WantedDto> wdto3 = sqlSession.selectList("com.nl.onl.myPage.getAllMyList", map);
//		
//		for(WantedDto wdto:wdto3) {
//			System.out.println("3. "+wdto);
//		}
//	}	
//	
//	@Test
//	public void test4() {
//		Map<String, Integer> map=new HashMap<String, Integer>();
//		map.put("selector", 1);
//		map.put("seq", 1);
//		
//		List<WantedDto> wdto4 = sqlSession.selectList("com.nl.onl.myPage.selector", map);
//		
//		for(WantedDto wdto:wdto4) {
//			System.out.println("4. "+wdto);
//		}
//	}
//	
//	@Test
//	public void test5() {
//		Map<String, String> map=new HashMap<String, String>();
//		map.put("id", "onltest1");
//		map.put("type", "OFFER");
//		map.put("pnum", "1");
//		
//		List<ReviewDto> wdto5 = sqlSession.selectList("com.nl.onl.myPage.getReview", map);
//		
////		System.out.println(wdto5);
//		for(ReviewDto wdto:wdto5) {
//			System.out.println("5. "+wdto);
//		}
//	}
//	
//	@Test
//	public void test6() {
//		
//		int pcount = sqlSession.selectOne("com.nl.onl.myPage.pcount");
//		
//		System.out.println("6." +pcount);
//		
////		for(WantedDto wdto:wdto6) {
////			System.out.println("6. "+wdto);
////		}
//	}
	
	
//	채팅테스트
//메시지 받아오기(현재 접속한 유저는 onltest1)
	@Test
	public void test1() {
		Map<String, String> map=new HashMap<String, String>();
		map.put("receive_id", "onltest1");
		map.put("send_id", "onltest2");
		
		List<ChatDto> wdto1 = sqlSession.selectList("com.nl.onl.chat.getMessage", map);
		
		for(ChatDto wdto:wdto1) {
			System.out.println("1. "+wdto);
		}
	}
	
//메시지 받아오면 chkflag 'Y'로 변경	
	@Test
	public void test2() {
		Map<String, String> map=new HashMap<String, String>();
		map.put("chkflag", "Y");
		map.put("receive_id", "onltest1");
		
		List<ChatDto> wdto2 = sqlSession.selectList("com.nl.onl.chat.checkChkflag", map);
		
		for(ChatDto cdto:wdto2) {
			System.out.println("2. "+cdto);
		}
	}
	
//메시지 보내기
	@Test
	public void test3() {
		ChatDto cdto=new ChatDto(0, "onltest1", "onltest3", "테스트1이 테스트3한테 전송22", null, "N", "N", 5);
		
		int isS = sqlSession.insert("com.nl.onl.chat.sendMessage", cdto);
		
//		for(ChatDto wdto:isS) {
//			System.out.println("3. "+wdto);
//		}
	}
	
//받는 회원이 탈퇴이거나 정지상태인 경우 
	@Test
	public void test4() {
		
		String id = sqlSession.selectOne("com.nl.onl.chat.checkDelflag", "onltest1");
		System.out.println("4. "+id);
	}
	
//채팅리스트(onltest1) 
//타겟아이디 | 구인글 번호 | 내가 확인안한 메시지 수 | 마지막메시지 | 마지막 메시지 시간 
	@Test
	public void test5() {
		Map<String, String> map=new HashMap<>();
		map.put("receive_id", "onltest1");
		map.put("send_id", "onltest3");
		
		List<ChatDto> list = sqlSession.selectList("com.nl.onl.chat.chatList", map);
	
		System.out.println("5. "+list);
	}
}

