package com.nl.onl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;
import com.nl.onl.service.IMyPageService;
import com.nl.onl.service.IWantedService;
import com.nl.onl.util.Util;

@Controller
public class WantedController {
	
	@Autowired
	IWantedService wantedServiceImp;
	
	@Autowired
	IMyPageService myPageServiceImp;
	
	@Autowired
	Util onlUtil;
	
	
	//구인글 노출(인덱스 페이지)
	@RequestMapping(value="indexwanted.do", method=RequestMethod.GET)
	public String indexWanted() {
		
		return "";
	}
	
	
	//구인글 검색
	@RequestMapping(value="search.do", method=RequestMethod.GET)
	public String searchWanted(Model model, SearchDto sdto, Authentication auth) {
		
		List<WantedDto> wlist = new ArrayList<>(); 
		
		if(sdto.getPnum() == null) {
			sdto.setPnum("1");
		}
		
		if(auth != null && auth.isAuthenticated()) {
			wantedServiceImp.getWantedListLogin(sdto);
		}else {
			wantedServiceImp.getWantedList(sdto);
		}
		
		model.addAttribute("wlist",wlist);
		return "wantedlist";
	}
	
	//구인글 상세보기
	@RequestMapping(value="wanted.do", method=RequestMethod.GET)
	public String getWantedDetail(Model model, Authentication auth, String seq) {
		System.out.println(auth == null? true: false);
		List<WantedDto> wlist = new ArrayList<>();
		
		if(seq == null) {
			seq = "0";
		}
		
		if(auth != null && auth.isAuthenticated()) {
			LoginDto ldto = (LoginDto)auth.getPrincipal();
			String id = ldto.getId();
			
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("seq", seq);
			
			model.addAttribute("hasacc", ldto.getHasacc());
			

			wlist = wantedServiceImp.getWantedDetailLoginT(map);
			model.addAttribute("wlist",wlist);
			System.out.println(wlist);
		}else{
			
			wlist = wantedServiceImp.getWantedDetailT(seq);
			model.addAttribute("wlist",wlist);
			
		}
		
		return "wanteddetail";
	}
	
	//카테고리 얻어오기
	@RequestMapping(value="/getcategory.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray getCategory() throws UnsupportedEncodingException {
		
		List<CategoryDto> clist = wantedServiceImp.getCategory();
		
		JSONArray cArray = null;
		
		cArray = onlUtil.toJArr(clist);
		
		return cArray;
	}
	
	//미사용
//	@RequestMapping(value="category.do", method=RequestMethod.GET)
//	public String getListByCategory(Model model) {
//		
//		return "wantedlist";
//	}
	
	//구인글 작성 폼
	@Secured({"ROLE_USER"})
	@RequestMapping(value="writewantedform.do", method=RequestMethod.GET)
	public String writeWantedForm(Model model, Authentication auth, HttpServletRequest request) throws UnsupportedEncodingException, JsonProcessingException, ParseException {
//		ObjectMapper mapper = new ObjectMapper();
//		
//		
//		List<CategoryDto> clist = wantedServiceImp.getCategory();
//		
//		JSONArray cArray = onlUtil.toJArr(clist);
		
		String location = onlUtil.getCookie("locationCookie", request).getValue();
		location = URLDecoder.decode(location, "utf-8");
		model.addAttribute("location", location);
//		model.addAttribute("cArray", cArray);
		
		return "wantedform";
	}
	
	
	//내가 쓴 구인글 가져오기
	@RequestMapping(value="getmydoclist.do", method=RequestMethod.POST)
	@ResponseBody
	public JSONArray getMyWantedDocList(Authentication auth) {
		JSONArray jArr = null;
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		List<WantedDto> wlist = wantedServiceImp.getMyDoc(ldto.getId());
		jArr = onlUtil.toJArr(wlist);
		
		return jArr;
	}
	
	
	//구인글 작성 메소드
	@Secured({"ROLE_USER"})
	@RequestMapping(value="writewanted.do", method=RequestMethod.POST)
	public String writeWanted(Model model, Authentication auth, WantedDto wdto, String telpub,  MultipartFile[] file) {
	
		boolean isS = false;
		System.out.println(wdto.getLocation());
		wdto.setLocation(wdto.getLocation().trim());
		wdto.setLoc_detail(wdto.getLoc_detail().trim());
		LoginDto ldto = (LoginDto)auth.getPrincipal();

		wdto.setId(ldto.getId());
		wdto.setPhone(telpub+ldto.getPhone());

		wdto.setSdate(wdto.getSdate().replace("-", ""));
		wdto.setEdate(wdto.getEdate().replace("-", ""));
		

		System.out.println(wdto.getContent());
		List<FileDto> flist = onlUtil.letUpload("WANTED_POST", file, ldto.getId());
		
		
		if(flist != null) {
			//실제 수행
			isS = wantedServiceImp.insertWantedT(wdto, flist);
			if(!isS) {
				model.addAttribute("msg", "글 등록에 실패하였습니다.\n 관리자에게 문의해 주세요[DB 오류]");
			}
			
		}else {
			
			model.addAttribute("msg", "글 등록에 실패하였습니다.\n 관리자에게 문의해 주세요[파일 업로드 오류]");
			
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="modifywantedform.do", method=RequestMethod.GET)
	public String modifyWantedForm(Model model, Authentication auth) {
		
		//차후 로그인 검증 및 아이디 검사 추가
		
		return "modifywanted";
	}
	
	
	//-----------------수정중
	@RequestMapping(value="modifywanted.do", method=RequestMethod.POST)
	public String modifyWanted(Model model, Authentication auth, WantedDto wdto, MultipartFile[] file, String preLocation) {
		List<FileDto> flist = null;
		boolean isS = wantedServiceImp.updateWantedT(wdto, flist, preLocation);
		
		if(!isS) {
			model.addAttribute("msg", "글 수정에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return "redirect:/wanted.do?seq="+wdto.getSeq();
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="apply.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertApply(Model model, Authentication auth, String wanted_seq) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		boolean isS = wantedServiceImp.insertApplyT(new ApplyDto(0, ldto.getId(), Integer.parseInt(wanted_seq), null, 0, null));
		String msg = "";
		
		if(isS) {
			msg = "지원에 성공하였습니다.";
		}else {
			msg = "지원에 실패하였습니다.";
		}
		
		return msg;
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="cancelapply.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteApply(Model model, Authentication auth, String wanted_seq) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		Map<String, String> map = new HashMap<>();
		map.put("id", ldto.getId());
		map.put("wanted_seq", wanted_seq);
		
		boolean isS = wantedServiceImp.deleteApplyT(map);
		String msg = "";
		
		if(isS) {
			msg = "성공적으로 지원 취소되었습니다.";
		}else {
			msg = "지원 취소에 실패하였습니다.";
		}
		
		return msg;
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="addwish.do", method=RequestMethod.POST)
	@ResponseBody
	@Secured({"ROLE_USER"})
	public String addWish(Model model, Authentication auth, String wanted_seq, HttpServletRequest request) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		WishDto wdto = new WishDto(0, ldto.getId(), Integer.parseInt(wanted_seq));

//		if(wantedServiceImp.insertWish(wdto)) {
//			
//			HttpSession session = request.getSession();
//			List<String> wishlist = (List<String>)session.getAttribute("wishlist");
//			wishlist.add(seq);
//			
//			session.setAttribute("wishlist", wishlist);
//			
//			return "success";
//			
//		}else {
//			return "fail";
//		}
		
		return wantedServiceImp.insertWish(wdto) ? "success" : "fail";
		
	}
	
	@RequestMapping(value="delwish.do", method=RequestMethod.POST)
	@ResponseBody
	@Secured({"ROLE_USER"})
	public String delWish(Model model, Authentication auth, String wanted_seq, HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<>();
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		
		map.put("id", ldto.getId());
		map.put("wanted_seq", wanted_seq);
		
//		if(myPageServiceImp.delWishlist(seq)) {
//			HttpSession session = request.getSession();
//			List<String> wishlist = (List<String>)session.getAttribute("wishlist");
//			
//			int wIndex = 0;
//			for(String s:wishlist) {
//				if(s.equals(seq)) {
//					wishlist.remove(wIndex);
//				}
//				wIndex++;
//			}
//			
//			session.setAttribute("wishlist", wishlist);
//			
//			return "success";
//			
//		}else {
//			
//			return "fail";
//		}
		return wantedServiceImp.delWishList(map) ? "success" : "fail";
	}
	
	
}
