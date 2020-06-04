package com.nl.onl.service;

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
	public ChatDto getMessage(Map<String, String> map) {
		
		return chatDaoImp.getMessage(map);
	}

	@Override
	public boolean checkChkflag(Map<String, String> map) {
		
		return chatDaoImp.checkChkflag(map);
	}

	@Override
	public boolean sendMessage(ChatDto cdto) {
		
		return chatDaoImp.sendMessage(cdto);
	}

	@Override
	public String checkDelflag(Map<String, String> map) {
		
		return chatDaoImp.checkDelflag(map);
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
