package com.nl.onl.util;


import java.util.HashMap;


import java.util.Map;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.service.IChatService;

@Component
public class EchoHandler extends TextWebSocketHandler {
	
		@Autowired
		IChatService chatServiceImp;
		
	
		//아이디와 세션아이디를 매칭 = 로그인 리스트
		Map<String, WebSocketSession> loginSessionsMap = new HashMap<>();
		
		//채팅방의 맵
		Map<String, ChatRoom> chatRoomMap = new HashMap<>();
		
		//해당 유저가 접속한 채팅창의 키 리스트
		Map<String, String> checkedIn = new HashMap<>();
		
		
		//서버에 접속이 성공 했을때
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			UsernamePasswordAuthenticationToken ut = (UsernamePasswordAuthenticationToken)session.getPrincipal();
			LoginDto ldto = (LoginDto)ut.getPrincipal();
			String id = ldto.getId();
			
			loginSessionsMap.put(id, session);

			

			System.out.println("웹소켓 연결 성공");
		}
		
		//소켓에 메세지를 보냈을때
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			UsernamePasswordAuthenticationToken ut = (UsernamePasswordAuthenticationToken)session.getPrincipal();
			LoginDto ldto = (LoginDto)ut.getPrincipal();
			String id1 = ldto.getId();
			
			
			
			String msg = message.getPayload();
			System.out.println(msg);
			
			JSONParser parser = new JSONParser();
			JSONObject jObj = (JSONObject)parser.parse(msg);
			
			String id2 = (String)jObj.get("receive_id");
			String wanted_seq = (String)jObj.get("wanted_seq");
			String chatdate = (String)jObj.get("chatdate");
			
			String roomId = makeRoomId(id1, id2);
			ChatRoom thisRoom = chatRoomMap.get(roomId);
			
//			System.out.println(jObj);
			
			if(((String)jObj.get("type")).equals("enter")) {
				
				if(thisRoom == null) {
					chatRoomMap.put(roomId, new ChatRoom(id1, id2, roomId));
				}else {
					thisRoom.setUserId(id1);
				}
				
				checkedIn.put(id1, roomId);
				System.out.println("Room checkin success");
				
			}else if(((String)jObj.get("type")).equals("msg")){
				//메시지를 보냈을때
				

				String msgText = (String)jObj.get("msg");
				ChatDto cdto = new ChatDto(0, id2, id1, msgText, null, "N", "N", (wanted_seq == null? 0 : Integer.parseInt(wanted_seq)));
				System.out.println(cdto);
				
				//나와의 채팅방에 들어와 있는지
				if(thisRoom.isIn()) {
					WebSocketSession ws = loginSessionsMap.get(id2);
					System.out.println("isIn");
					System.out.println(ws);
					if(ws != null) {
						System.out.println("메시지 보내기 전");
						
						JSONObject mj = new JSONObject();
						mj.put("id", id1);
						mj.put("msg", msgText);
						mj.put("chatdate", chatdate);
						
						ws.sendMessage(new TextMessage(mj.toJSONString()));
						System.out.println("dd");
						cdto.setChkflag("Y");
					}
				}
				
				//최종적으로는 DB에 채팅로그 저장
				chatServiceImp.sendMessageT(cdto);
				
			}else if(((String)jObj.get("type")).equals("leave")) {
				
				String roomKey = checkedIn.get(id1);
				checkOut(roomKey, id1);
			}
			
		}
		
		//연결 해제될때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
			UsernamePasswordAuthenticationToken ut = (UsernamePasswordAuthenticationToken)session.getPrincipal();
			LoginDto ldto = (LoginDto)ut.getPrincipal();
			String id = ldto.getId();
			
			String roomKey = checkedIn.get(id);
			
			checkOut(roomKey, id);
			
			
			loginSessionsMap.remove(id);
			System.out.println("Room checkout success");
		}
		
		
		//채팅방 식별자 만들기
		public String makeRoomId(String id1, String id2) {
			//알파벳순으로 정렬, 알파벳이 똑같다면 숫자순으로 정렬
			String result = "";
			
			if(id1.charAt(0) > id2.charAt(0)) {
				result = id1 +"-" +id2;
			}else if(id1.charAt(0) < id2.charAt(0)) {
				result = id2 +"-" +id1;
			}else {
				
				int s1 = Integer.parseInt(id1.substring(1));
				int s2 = Integer.parseInt(id2.substring(1));
				
				if(s1 > s2) {
					result = id1 +"-" +id2;
				}else {
					result = id2 +"-" +id1;
				}
			}
			
			
			return result;
		}
		
		//체크아웃
		public void checkOut(String roomKey, String id) {
			
			if(roomKey != null && !roomKey.equals("")) {
				ChatRoom room = chatRoomMap.get(roomKey);
				
				room.leaveRoom(id);
				if(room.isEmpty()) {
					chatRoomMap.remove(roomKey);
				}
				
				checkedIn.remove(id);
			}
			
		}
}
