package com.nl.onl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.util.Util;




@Controller
public class EmailController {

	
//	@Autowired 
//	private JavaMailSenderImpl mailSender;

//	@RequestMapping(value = "/mailConfirm.do", method = RequestMethod.POST) 
//	public @ResponseBody String regist(Model model, String email) { 
//		System.out.println("서버접속성공");
//		Util uran=new Util();
//		String rannum = uran.random();
//		
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				
//				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
//				helper.setFrom("김태환<01028257766k@gmail.com>"); 
//				helper.setTo(email); 
//				helper.setSubject("[오늘,내:일] 인증번호 를 입력해주세요."); 
//				helper.setText("[오늘,내:일] 인증번호 ["+rannum+"]를 입력해주세요.", true);
//			}
//		};  
//		mailSender.send(preparator); 
//		return rannum; 
//	}
	

}
