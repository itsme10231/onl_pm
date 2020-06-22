package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.NotifyDto;

public interface INotifyService {
	
	public boolean insertNotify(NotifyDto ndto);
	
	public boolean checkNotify(String id);
	
	public boolean deleteNotify();
	
	public List<NotifyDto> getNotify(Map<String, String> map);
}
