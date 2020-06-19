package com.nl.onl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.daos.IChatDao;
import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.ChatlistDto;

public class ChatServiceImp implements IChatService{

	@Autowired
	private IChatDao chatDaoImp;
	
	@Override
	public ChatDto getMessageT(Map<String, String> map) {
		chatDaoImp.checkChkflag(map);
		return chatDaoImp.getMessage(map);
	}


	@Override
	public boolean sendMessage(ChatDto cdto) {
		Map<String, String> map = new HashMap<>();
		map.put("id", cdto.getSend_id());
		map.put("target_id", cdto.getReceive_id());
		
		String result = chatDaoImp.checkDelflag(map);
		
		if(result == null || result.equals("")) {
			return false;
		}else {
			return chatDaoImp.sendMessage(cdto);
		}
	}


	@Override
	public List<ChatlistDto> chatList(Map<String, String> map) {
		
		return chatDaoImp.chatList(map);
	}

	@Override
	public int getPaging(String id) {
		
		return chatDaoImp.getPaging(id);
	}

}
