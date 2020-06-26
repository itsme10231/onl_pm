package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IScheduleDao;
import com.nl.onl.dtos.WantedDto;

@Service
public class ScheduleServiceImp implements IScheduleService{

	@Autowired
	private IScheduleDao scheduleDaoImp;
	
	@Override
	public List<WantedDto> worked(Map<String, String> map) {
		
		return scheduleDaoImp.worked(map);
	}

	@Override
	public List<WantedDto> working(Map<String, String> map) {
		
		return scheduleDaoImp.working(map);
	}

	@Override
	public List<WantedDto> plan(Map<String, String> map) {
		
		return scheduleDaoImp.plan(map);
	}

}
