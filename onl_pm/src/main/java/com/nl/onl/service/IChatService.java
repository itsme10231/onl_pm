package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.ChatlistDto;

public interface IChatService {

//	메시지 받아오기
	public List<ChatDto> getMessageT(Map<String, String> map);
	
//	메시지 받아오면 chkfalg 'Y'로 변경, 트랜잭션 처리
//	public boolean checkChkflag(Map<String, String> map);

//	메시지 보내기
	public boolean sendMessageT(ChatDto cdto);
	
//	채팅리스트(onltest1)
//	타겟아이디 | 구인글 번호 | 내가 확인안한 메시지 수 | 마지막메시지 | 마지막 메시지 시간
	public List<ChatlistDto> chatList(Map<String, String> map);
	
//	채팅리스트 페이징 넘버
	public int getPaging(String id);
}
