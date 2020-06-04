package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.ChatlistDto;

public interface IChatDao {

//	메시지 받아오기
	public ChatDto getMessage(Map<String, String> map);
	
//	메시지 받아오면 chkfalg 'Y'로 변경
	public boolean checkChkflag(Map<String, String> map);

//	메시지 보내기
	public boolean sendMessage(ChatDto cdto);
	
//	받는 회원이 탈퇴했거나 정지상태거나 블랙리스트에 등록되었을 경우
	public String checkDelflag(Map<String, String> map);
	
//	채팅리스트(onltest1)
//	타겟아이디 | 구인글 번호 | 내가 확인안한 메시지 수 | 마지막메시지 | 마지막 메시지 시간
	public List<ChatlistDto> chatList(Map<String, String> map);
	
//	채팅리스트 페이징 넘버
	public int getPaging(String id);
}
