package com.nl.onl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IChatDao;
import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.ChatlistDto;

@Service
public class ChatServiceImp implements IChatService{

	@Autowired
	private IChatDao chatDaoImp;
	
	@Override
	public List<ChatDto> getMessageT(Map<String, String> map) {
		chatDaoImp.checkChkflag(map);
		return chatDaoImp.getMessage(map);
	}


	@Override
	public boolean sendMessageT(ChatDto cdto) {
		Map<String, String> map = new HashMap<>();
		map.put("id", cdto.getSend_id());
		map.put("target_id", cdto.getReceive_id());
		map.put("wanted_seq", cdto.getWanted_seq()+"");
		
		String result = chatDaoImp.checkDelflag(map);
		
		if(result == null || result.equals("")) {
			return chatDaoImp.sendMessage(cdto);
		}else {
			return false;
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
