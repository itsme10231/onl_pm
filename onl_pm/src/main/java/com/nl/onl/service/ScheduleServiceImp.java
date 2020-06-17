package com.nl.onl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IScheduleDao;
import com.nl.onl.dtos.WantedDto;

@Service
public class ScheduleServiceImp implements IScheduleService{

	@Autowired
	private IScheduleDao scheduleDaoImp;
	
	@Override
	public List<WantedDto> worked(String id) {
		
		return scheduleDaoImp.worked(id);
	}

	@Override
	public List<WantedDto> working(String id) {
		
		return scheduleDaoImp.working(id);
	}

	@Override
	public List<WantedDto> plan(String id) {
		
		return scheduleDaoImp.plan(id);
	}

}
