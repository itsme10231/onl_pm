package com.nl.onl;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;
import com.nl.onl.service.ILoginService;
import com.nl.onl.service.IPaymentService;
import com.nl.onl.util.Util;

@Controller
public class InfoController {
	
	@Autowired
	ILoginService loginServiceImp;
	
	@Autowired
	IPaymentService paymentServiceImp;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	Util onlUtil;
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/memberinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String toMemeberInfo() {
		
		return "redirect:/myinfo.do";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberInfo(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		model.addAttribute("ldto", ldto);
		
		return "memberinfo";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/updatemyinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMemberInfo(Model model, Authentication auth, LoginDto ldto, String old_password) {
		Date defaultDate = onlUtil.toDate("1900-01-01");
		
		
		if(ldto.getBirth().compareTo(defaultDate) == 0) {
			ldto.setBirth(null);	
		}	
		
		String credential = (String)auth.getCredentials();
		
		if(ldto.getPassword() != null) {
			if(!passwordEncoder.matches(old_password, credential)) {
				ldto.setPassword((String)auth.getCredentials());
				model.addAttribute("msg","비밀번호가 일치하지 않아 수정되지 않았습니다.");
			}else {
				ldto.setPassword(passwordEncoder.encode(ldto.getPassword()));
			}
		}else {
			ldto.setPassword(credential);
		}
		
		boolean isS = loginServiceImp.updateInfo(ldto);
		if(isS) {
			
			//회원정보를 새로고침
			Authentication newAuth = new UsernamePasswordAuthenticationToken(ldto, ldto.getPassword(), auth.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(newAuth);
			
			return "redirect:/memberinfo.do";
		}else {
			
			model.addAttribute("msg","회원정보 수정에 실패하였습니다.");
			return "redirect:/memberinfo.do";
		}

	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myProfile(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		ProfileDto pdto = null;
		pdto = loginServiceImp.getProfile(id);
		
		model.addAttribute("pdto", pdto);
		
		return "myprofile";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/writeprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeProfileForm(Model model, Authentication auth) {
		
		
		
		return "writeprofile";
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/insertmyprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertMyProfile(Model model, Authentication auth, ProfileDto pdto, MultipartFile[] file) {
		boolean isS = false;
		System.out.println(pdto);
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		List<FileDto> flist = new ArrayList<>();
		
		pdto.setId(ldto.getId());
		
		if(file.length != 0) {
			flist = onlUtil.letUpload("PROFILE", file, ldto.getId());
		}
		
		if(flist != null) {
			//실제 수행
			isS = loginServiceImp.insertProfileT(pdto, flist);
			if(!isS) {
				model.addAttribute("msg", "프로필 등록에 실패하였습니다.\n 관리자에게 문의해 주세요[DB 오류]");
			}
			
		}else {
			
			model.addAttribute("msg", "프로필 등록에 실패하였습니다.\n 관리자에게 문의해 주세요[파일 업로드 오류]");
			
		}
		
		return "redirect:/myprofile.do";
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/modifyprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String modifyMyProfileForm(Model model, Authentication auth) {
		
		return "modifyprofile";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/updatemyprofile.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMyProfile(Model model, Authentication auth, ProfileDto pdto) {
		
		boolean isS = loginServiceImp.updateProfile(pdto);
		
		if(isS) {
			model.addAttribute("pdto", pdto);
			return "myprofile";
		}else {
			model.addAttribute("msg", "프로필 등록에 실패했습니다.");
			return "redirect:/myprofile.do";
		}
		
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/myaccount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myAccount(Model model, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		AccountDto adto = null;
		
		if(ldto.getHasacc().equals("Y")) {
			adto = paymentServiceImp.getAccount(id);
		}
		
		model.addAttribute("adto", adto);
		
		return "myaccount";
	}
	
	@Secured("ROLE_USER")
	@RequestMapping(value = "/mywishlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myWishlist(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		if(pnum == null || pnum.equals("")) {
			pnum = "1";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pnum", pnum);
		
		List<WantedDto> wlist = new ArrayList<>();
		wlist = loginServiceImp.getWishList(map);
		
		if(wlist.size() != 0) {
			String allC = wlist.get(0).getResult_c();
			int allP = (int)Math.ceil(Double.parseDouble(allC)/20);
			
			Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
			System.out.println(wlist);
			
			model.addAttribute("wlist",wlist);
			model.addAttribute("allP", allP);
			model.addAttribute("pnum", pnum);
			model.addAllAttributes(pageMap);
		}else {
			model.addAttribute("pnum", pnum);
		}
		
		
		model.addAttribute(wlist);
		
		return "mywish";
	}
	
	//계좌수정기능 추후 추가
}
