package com.nl.onl.util;

public class ChatRoom {
	
	
	private String roomId;
	private String id1;
	private String id2;
	
	public ChatRoom() {
		this.id1 = null;
		this.id2 = null;
	}
	
	public ChatRoom(String id, String receive_id, String roomId) {
		//생성됐을때
		this.id1 = id;
		this.id2 = null;
		this.roomId = roomId;
	}
	
	
	public String getRoomId() {
		return this.roomId;
	}
	
	public void setRoomId(String id, String receive_id) {
		this.roomId = makeRoomId(id, receive_id);
	}
	
	public String makeRoomId(String id1, String id2) {
		//알파벳순으로 정렬, 알파벳이 똑같다면 숫자순으로 정렬
		String result = "";
		
		if(id1.charAt(0) > id2.charAt(0)) {
			result = id1 +id2;
		}else if(id1.charAt(0) < id2.charAt(0)) {
			result = id2 +id1;
		}else {
			
			int s1 = Integer.parseInt(id1.substring(1));
			int s2 = Integer.parseInt(id2.substring(1));
			
			if(s1 > s2) {
				result = id1 +id2;
			}else {
				result = id2 +id1;
			}
		}
		
		return result;
	}
	
	//채팅창을 떠났을때
	public void leaveRoom(String id) {
		if(id.equals(id1)) {
			id1 = null;
		}else if(id.equals(id2)){
			id2 = null;
		}
		
	}
	
	//채팅방이 비어있는지 검사
	public boolean isEmpty() {
		
		if(id1 == null && id2 == null) {
			return true;
		}else {
			return false;
		}
		
	}
	
	//채팅방에 해당 유저가 들어와 있는지 검사
	public boolean isIn() {
		if(id1 == null || id2 == null) {
			return false;
		}
		return true;
	}
	
	
	
	
	public String getId1() {
		return this.id1;
	}
	
	public String getId2() {
		return this.id2;
	}
	
	public void setUserId(String id) {
		if(id1 == null) {
			this.id1 = id;
		}else if(id2 == null) {
			this.id2 = id;
		}
	}
}
