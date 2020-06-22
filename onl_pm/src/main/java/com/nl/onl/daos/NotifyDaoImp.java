package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.NotifyDto;

@Repository
public class NotifyDaoImp implements INotifyDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String nameSpace = "com.nl.onl.notify.";
	
	@Override
	public boolean insertNotify(NotifyDto ndto) {
		int isS = sqlSession.insert(nameSpace+"insertNotify", ndto);
		return isS > 0 ? true: false;
	}

	@Override
	public boolean checkNotify(String id) {
		int isS = sqlSession.insert(nameSpace+"checkNotify", id);
		return isS > 0 ? true: false;
	}

	@Override
	public boolean deleteNotify() {
		int isS = sqlSession.delete(nameSpace+"deleteNotify");
		return isS > 0 ? true: false;
	}

	@Override
	public List<NotifyDto> getNotify(Map<String, String> map) {
		return sqlSession.selectList(nameSpace+"getNotify", map);
	}
	
}
