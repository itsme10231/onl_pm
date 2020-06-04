package com.nl.onl.daos;

import java.util.List;

import javax.xml.stream.events.Namespace;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.dtos.WantedDto;

public class ScheduleDaoImp implements IScheduleDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.nl.onl.scheduel.";
	
	@Override
	public List<WantedDto> worked(String id) {
		
		return sqlSession.selectList(namespace+"worked", id);
	}

	@Override
	public List<WantedDto> working(String id) {
		
		return sqlSession.selectList(namespace+"working", id);
	}

	@Override
	public List<WantedDto> plan(String id) {
		
		return sqlSession.selectList(namespace+"plan", id);
	}

	
}
