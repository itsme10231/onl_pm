package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.NotifyDto;

public interface INotifyDao {
	
	public boolean insertNotify(NotifyDto ndto);
	
	public boolean checkNotify(String id);
	
	public boolean deleteNotify();
	
	public List<NotifyDto> getNotify(Map<String, String> map);
}
