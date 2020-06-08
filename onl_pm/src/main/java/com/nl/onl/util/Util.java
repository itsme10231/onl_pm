package com.nl.onl.util;

public class Util {

	public String random() {
		
		int ran;
		String dom ="";
		ran = (int) (Math.random()*10);
		
			for (int i = 0; i < 6; i++) {
				dom+=(int) (Math.random()*10);
			}
			
		return dom;
	}
}
