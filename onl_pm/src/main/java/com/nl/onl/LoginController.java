package com.nl.onl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;
import com.nl.onl.service.ILoginService;
import com.nl.onl.util.Util;

@Controller
public class LoginController {
	
	@Autowired
	private ILoginService loginServiceImp;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	Util onlUtil;
	
	
	@RequestMapping(value = "/registform.do", method = {RequestMethod.GET})
	public String registForm(Model model, String id, String pw) {
		
		
		
		return "regist";
	}
	
	
	@RequestMapping(value = "/emailchk.do", method = {RequestMethod.POST})
	@ResponseBody
	public String mailCheck(Model model, String email) {
		
		String s = loginServiceImp.checkEmail(email);
		
		if(s == null || s.equals("")) {
			return "ABLE";
		}else {
			return "DISABLE";
		}
	}
	
	@RequestMapping(value = "/mailConfirm.do", method = RequestMethod.POST) 
	public @ResponseBody String mailConfirm(Model model, String email) { 
		System.out.println("서버접속성공");
		
		String rannum = onlUtil.random();
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom("김태환<01028257766k@gmail.com>"); 
				helper.setTo(email); 
				helper.setSubject("[오늘,내:일] 인증번호 를 입력해주세요."); 
				helper.setText("[오늘,내:일] 인증번호 ["+rannum+"]를 입력해주세요.", true);
			}
		};  
		mailSender.send(preparator); 
		return rannum; 
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET})
	public String loginForm() {
		
		//로그인 페이지만 호출, 로그인 과정은 시큐리티가 수행
		
		return "login";
	}
	
	@RequestMapping(value = "/outlogin.do", method = {RequestMethod.POST})
	public String outLogin() {
		
		
		
		return "login";
	}
	
	
	//나의 프로필 보기
	@RequestMapping(value = "/member/profile.do", method = {RequestMethod.GET})
	public String getProfile(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		ProfileDto pdto = loginServiceImp.getProfile(ldto.getId());
		
		model.addAttribute("pdto", pdto);
		
		return "profile";
	}
	
	//다른 유저의 프로필 보기
}
