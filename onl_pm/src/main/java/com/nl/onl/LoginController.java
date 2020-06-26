package com.nl.onl;



import java.text.ParseException;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
	@RequestMapping(value = "/registform.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String registForm() {
		
		
		
		return "regist";
	}
	
	@RequestMapping(value = "/regist.do", method = {RequestMethod.POST})
	public String regist(Model model, @ModelAttribute LoginDto ldto) {
		

		Date defaultDate = onlUtil.toDate("1900-01-01");
		boolean isS = false;
		
		
		if(ldto.getBirth().compareTo(defaultDate) == 0) {
			ldto.setBirth(null);	
		}	
		
		ldto.setRole("USER");
		ldto.setRegflag(ldto.getRegflag().trim());
		isS = loginServiceImp.insertMember(ldto);
			
		
		
		if(isS) {
			model.addAttribute("msg", "회원가입을 축하드립니다.");
			System.out.println("success");
		}else {
			model.addAttribute("msg", "회원가입에 실패하였습니다. 관리자에게 문의해 주세요.");
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/emailchk.do", method = {RequestMethod.POST})
	@ResponseBody
	public String mailCheck(Model model, String email) {
//		System.out.println(email);
		String s = loginServiceImp.checkEmail(email);
//		System.out.println("s: "+s);
		if(s == null || s.equals("")) {
//			System.out.println("able");
			return "ABLE";
		}else {
			return "DISABLE";
		}
	}
	
	@RequestMapping(value = "/mailConfirm.do", method = RequestMethod.POST) 
	public @ResponseBody String mailConfirm(Model model, String email) { 
//		System.out.println("서버접속성공");
		
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
	
	//회원탈퇴(신청)
	@RequestMapping(value="/member/withdraw.do", method = {RequestMethod.GET})
	public String withdrawMember(Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		loginServiceImp.updateDelflag(ldto.getId());
		
		return "redirect:/logout.do";
	}
	
	//회원정보삭제(quartz 이용예정)
	@RequestMapping(value="deletemember.do", method = {RequestMethod.GET})
	public void deleteMember() {
		boolean isS = loginServiceImp.deleteMember();
		if(isS) {
			System.out.println("error: 탈퇴회원 삭제 실패");
		}
	}
	
	
	//나의 프로필 보기, 다른 유저의 프로필 보기
	@RequestMapping(value = "/member/profile.do", method = {RequestMethod.GET})
	public String getProfile(Model model, Authentication auth, String id) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		ProfileDto pdto = null;
		
		if(id == null || id.equals("")) {
			
			pdto = loginServiceImp.getProfile(ldto.getId());
			
		}else {
			
			pdto = loginServiceImp.getProfile(id);
			
		}
		
		
		model.addAttribute("pdto", pdto);
		
		return "profile";
	}
	
	
	//프로필 작성
	@RequestMapping(value="/member/writeprofile.do", method= {RequestMethod.GET})
	public String writeProfileform(Model model) {
		
		
		
		return "writeprofile";
	}
	
	
	@RequestMapping(value="ajaxgetinfo.do", method= {RequestMethod.POST})
	@ResponseBody
	public JSONObject getInfo(Authentication auth) {
		
		JSONObject jObj = new JSONObject();
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		
		jObj.put("id", ldto.getId());
		jObj.put("email", ldto.getEmail());
		jObj.put("name", ldto.getName());
		jObj.put("phone", ldto.getPhone());
		jObj.put("address", ldto.getAddress_2() +" " +ldto.getAddress_3());
		jObj.put("postcode", ldto.getAddress_1());
		
		return jObj;
	}

}
