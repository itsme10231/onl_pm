package com.nl.onl.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nl.onl.dtos.LoginDto;

@Component
public class EchoHandler extends TextWebSocketHandler {
	
		
		//로그인한 전체유저 세션
		List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		//아이디와 세션아이디를 매칭 = 로그인 리스트
		Map<String, WebSocketSession> loginSessionsMap = new HashMap<>();
		
		//아이디와 세션아이디를 매칭 = 채팅창을 띄워놓은 리스트
		Map<String, WebSocketSession> chatSessionsMap = new HashMap<>();
		
		//서버에 접속이 성공 했을때
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			//접속자 넣기
			sessionList.add(session);
			
			//아이디와 세션을 매칭시켜 저장
			LoginDto ldto = (LoginDto)session.getPrincipal();
			loginSessionsMap.put(ldto.getId(), session);
		}
		
		//소켓에 메세지를 보냈을때
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//			String senderEmail = getEmail(session);
			//모든 유저에게 보낸다 - 브로드 캐스팅
//			for (WebSocketSession sess : sessions) {
//				sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//			}
			
	
			
			
			String msg = message.getPayload();
			
			JSONParser parser = new JSONParser();
			JSONObject jObj = (JSONObject)parser.parse(msg);
			
			System.out.println(jObj);
			
			//웹소켓 메시지의 타입은 두개(채팅chat, 알림notify)
			if(jObj.get("type") != null && !jObj.get("type").equals("")) {
				if(jObj.get("type").equals("chat")) {
					return;
					
					
					
					
				}else {
					//알림의 상세타입 type2
					return;
					
					
					
				}
			}
			
			
			
			
		}
		
		//연결 해제될때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

			LoginDto ldto = (LoginDto)session.getPrincipal();
			
			loginSessionsMap.remove(ldto.getId());
			sessionList.remove(session);
		}
		
		//웹소켓 email 가져오기
		private String getEmail(WebSocketSession session) {
			Map<String, Object> httpSession = session.getAttributes();
			for(String s:httpSession.keySet()) {
				System.out.println(s);
			}
			
			return "";
		}
}
