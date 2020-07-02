package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.page.Paging;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.QnaDto;
import com.nl.onl.dtos.ReportDto;
import com.nl.onl.service.IAdminService;
import com.nl.onl.util.Util;

@Controller
public class AdminController {
	
	@Autowired
	IAdminService adminServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@RequestMapping(value = "/doreport.do", method = RequestMethod.POST)
	@ResponseBody
	@Secured("ROLE_USER")
	public String insertReport(Model model, ReportDto rdto, Authentication auth) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		rdto.setId(ldto.getId());
		
		boolean isS = adminServiceImp.insertReport(rdto);
		
		if(isS) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value = "/getreportc.do", method = RequestMethod.POST)
	@ResponseBody
	@Secured("ROLE_USER")
	public JSONArray getReportCateogry() {
		
		List<ReportDto> rlist = adminServiceImp.getReportCategory();
		
		JSONArray jArr = null;
		
		if(rlist != null && rlist.size() != 0) {
			jArr = onlUtil.toJArr(rlist);
		}
		
		return jArr;
	}
	
	//관리자 신고목록 
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/reportlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reportlist(Model model,String pnum, Authentication auth) {
		if (pnum==null) {
			pnum="1";
		}
		int count= adminServiceImp.pcountReport();
		Map<String, Integer>map=Paging.pagingValue(count, pnum, 10);
		List<ReportDto> list = adminServiceImp.getAllListReport(pnum);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		return "reportlist";
	}
	
	
	
	//관리자 신고 상세보기
	@RequestMapping(value = "/reportdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reportdetail(Authentication auth, Locale locale, Model model, @RequestParam("seqparam") String seq) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);
//		LoginDto uDto = (LoginDto)auth.getPrincipal();
		ReportDto rdto = adminServiceImp.detailReport(seq);
		
	
		model.addAttribute("rdto",rdto);
		System.out.println(rdto.getSeq());
		return "reportdetail";
	}
	
	//신고 처리 (프로세스 complete)
	@RequestMapping(value = "/updateReport.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateReport(Authentication auth, Locale locale, Model model, String seq) {

//		LoginDto uDto = (LoginDto)auth.getPrincipal();
		
		Map<String, String> map= new HashMap<String, String>();
		map.put("seq", seq);
		map.put("process", "COMPLETE");
		System.out.println("seq "+seq);
		boolean isS = adminServiceImp.updateReport(map);
		if(isS) {
			System.out.println("success");
			return "redirect:reportlist.do";			
		}else {
			model.addAttribute("msg", "글처리실패");
			return "error";
		}
	
	}
	
	//신고재고 (프로세스 reject)
	@RequestMapping(value = "/updateReject.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateReject(Authentication auth, Locale locale, Model model, String seq) {

//		LoginDto uDto = (LoginDto)auth.getPrincipal();
		
		Map<String, String> map= new HashMap<String, String>();
		map.put("seq", seq);
		map.put("process", "REJECT");
		
		boolean isS = adminServiceImp.updateReport(map);
		if(isS) {
			System.out.println("success");
			return "redirect:reportlist.do";			
		}else {
			model.addAttribute("msg", "글처리실패");
			return "error";
		}
	
	}
	
	//관리자페이지 회원전체목록
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/adminlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminlist(Model model,String pnum, Authentication auth) {
		if (pnum==null) {
			pnum="1";
		}
		int count= adminServiceImp.pcountAdmin();
		Map<String, Integer>map=Paging.pagingValue(count, pnum, 20);
		List<LoginDto> list = adminServiceImp.getAllListAdmin(pnum);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
//		System.out.println("출력admin ! "+list.get(0).getRn());
		
		return "adminlist";
	}

	//관리자 페이지 회원 상세보기
	@RequestMapping(value = "/admindetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String admindetail(Locale locale, Model model, @RequestParam("idparam") String id) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);

		
		List<LoginDto> list = adminServiceImp.detailAdmin(id);
		System.out.println("seq출력! "+list.get(0).getReportDto().getSeq());
		System.out.println("내용출력! "+list.get(0).getReportDto().getContent());
		System.out.println("아이디출력! "+id);
		model.addAttribute("list",list);
		System.out.println("리스트 출력! "+list );
		return "admindetail";	
	}
	
	//회원 정지처리
	@RequestMapping(value = "/updateDel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateDel(Authentication auth, Locale locale, Model model, String id) {

//		LoginDto uDto = (LoginDto)auth.getPrincipal();
		
		Map<String, String> map= new HashMap<String, String>();
		map.put("delflag", "Y");
		map.put("id", id);
		System.out.println("id "+id);
		boolean isS = adminServiceImp.flagAdmin(map);
		if(isS) {
			System.out.println("success");
			return "redirect:adminlist.do";			
		}else {
			model.addAttribute("msg", "글처리실패");
			return "error";
		}
	
	}
	
	//회원 활동처리
	@RequestMapping(value = "/updateDel2.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateDel2(Authentication auth, Locale locale, Model model, String id) {

//		LoginDto uDto = (LoginDto)auth.getPrincipal();
		
		Map<String, String> map= new HashMap<String, String>();
		map.put("delflag", "N");
		map.put("id", id);
		System.out.println("id "+id);
		boolean isS = adminServiceImp.flagAdmin(map);
		if(isS) {
			System.out.println("success");
			return "redirect:adminlist.do";			
		}else {
			model.addAttribute("msg", "글처리실패");
			return "error";
		}
	
	}
}
