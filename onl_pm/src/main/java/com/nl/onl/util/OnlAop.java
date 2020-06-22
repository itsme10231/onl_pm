package com.nl.onl.util;

import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.service.INotifyService;

public class OnlAop {
	
	@Autowired
	INotifyService notifyServiceImp;
	
	public boolean afterReturning(JoinPoint join) {
		return false;
	}
}
