package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Namespace;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.WantedDto;
@Repository
public class ScheduleDaoImp implements IScheduleDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.nl.onl.schedule.";
	
	@Override
	public List<WantedDto> worked(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"worked", map);
	}

	@Override
	public List<WantedDto> working(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"working", map);
	}

	@Override
	public List<WantedDto> plan(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"plan", map);
	}

	
}
