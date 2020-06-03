package com.nl.onl.service;

import java.util.List;

import com.nl.onl.dtos.WantedDto;

public interface IScheduleService {

//	했던 일
	public List<WantedDto> worked(String id);
	
//	하고있는 일
	public List<WantedDto> working(String id);
	
//	하고있는 일
	public List<WantedDto> plan(String id);
}
