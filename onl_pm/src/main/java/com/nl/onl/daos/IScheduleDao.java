package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.WantedDto;

public interface IScheduleDao {

//	했던 일
	public List<WantedDto> worked(Map<String, String> map);
	
//	하고있는 일
	public List<WantedDto> working(Map<String, String> map);
	
//	하고있는 일
	public List<WantedDto> plan(Map<String, String> map);
	
}
