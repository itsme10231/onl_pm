package com.nl.onl.daos;

import java.util.List;

import com.nl.onl.dtos.WantedDto;

public interface IScheduleDao {

//	했던 일
	public List<WantedDto> worked(String id);
	
//	하고있는 일
	public List<WantedDto> working(String id);
	
//	하고있는 일
	public List<WantedDto> plan(String id);
	
}
