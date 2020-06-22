package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.INotifyDao;
import com.nl.onl.dtos.NotifyDto;

@Service
public class NotifyServiceImp implements INotifyService{

	@Autowired
	INotifyDao notifyDao;
	
	@Override
	public boolean insertNotify(NotifyDto ndto) {
		return notifyDao.insertNotify(ndto);
	}

	@Override
	public boolean checkNotify(String id) {
		return notifyDao.checkNotify(id);
	}

	@Override
	public boolean deleteNotify() {
		return notifyDao.deleteNotify();
	}

	@Override
	public List<NotifyDto> getNotify(Map<String, String> map) {
		return notifyDao.getNotify(map);
	}
	
}
