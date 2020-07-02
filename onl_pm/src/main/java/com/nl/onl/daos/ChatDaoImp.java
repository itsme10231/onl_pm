package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.ChatDto;
import com.nl.onl.dtos.ChatlistDto;

@Repository
public class ChatDaoImp implements IChatDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.nl.onl.chat.";
	
	@Override
	public List<ChatDto> getMessage(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"getMessage", map);
	}

	@Override
	public boolean checkChkflag(Map<String, String> map) {
		int count = sqlSession.update(namespace+"checkChkflag", map);
		return count > 0? true:false;
	}

	@Override
	public boolean sendMessage(ChatDto cdto) {
		int count = sqlSession.insert(namespace+"sendMessage", cdto);
		return count > 0? true:false;
	}

	@Override
	public String checkDelflag(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"checkDelflag", map);
	}

	@Override
	public List<ChatlistDto> chatList(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"getChatlist", map);
	}

	@Override
	public int getPaging(String id) {
		
		return sqlSession.selectOne(namespace+"getPaging", id);
	}

}
