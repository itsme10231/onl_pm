package com.nl.onl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.page.Paging;
import com.nl.onl.dtos.QnaDto;
import com.nl.onl.service.ICustomService;

@Controller
public class CustomerController {
	
	@Autowired
	ICustomService CustomServiceImp;
	
	//QNA 전체목록
	@RequestMapping(value = "/qnalist.do", method = {RequestMethod.GET})
	public String qnalist(Model model,String pnum) {
		if (pnum==null) {
			pnum="1";
		}
		List<QnaDto> list = CustomServiceImp.getAllListQna(pnum);
		int count= CustomServiceImp.pcountQna();
		
		Map<String, Integer>map=Paging.pagingValue(count, pnum, 5);
		
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		
		return "qnalist";
	}
	
	//QNA상세보기
	@RequestMapping(value = "/qnadetail.do", method = RequestMethod.GET)
	public String qnadetail(Locale locale, Model model, @RequestParam("seqparam") String seq) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);
		
		QnaDto qdto=CustomServiceImp.detailQna(seq);
		
		model.addAttribute("qdto",qdto);
		
		return "qnadetail";
	}
	
	
	//글쓰기폼 이동
	@RequestMapping(value = "/addForm.do", method = RequestMethod.GET)
	public String addForm(Locale locale, Model model) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);

		return "qnawrite";
	}
	
	//QNA쓰기
	
	@RequestMapping(value = "qnawrite.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String ansAddBoard(QnaDto qdto, Locale locale, Model model) {
		 
//		logger.info("글추가하기 {}.", locale);
		qdto.setId("O1");
		System.out.println(qdto);
		boolean isS=CustomServiceImp.insertQna(qdto);
		if(isS) {
			System.out.println("success");
			return "redirect:qnalist.do";			
		}else {
			model.addAttribute("msg", "글추가실패");
			return "error";
		}
		
	}
	//QNA삭제
	@RequestMapping(value = "deleteQna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteQna(String seq, Locale locale, Model model) {
		 
		boolean isS=CustomServiceImp.deleteQna(seq);
		if(isS) {
			return "redirect:qnalist.do";			
		}else {
			model.addAttribute("msg", "글삭제실패");
			return "error";
		}
		
	}
	//QNA수정폼 이동
	@RequestMapping(value = "/updateQna.do", method = RequestMethod.GET)
	public String updateForm(@RequestParam("seq") String seq,Locale locale, Model model) {
		 // @RequestParam("seq"): "seq" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
	
		
		QnaDto qdto=CustomServiceImp.detailQna(seq);
		
		model.addAttribute("qdto", qdto);
		 System.out.println(qdto);
		return "qnaupdate";
	}
	//QNA수정
	@RequestMapping(value = "qnaUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String ansboardUpdate(QnaDto qdto, Locale locale, Model model) {
//		 System.out.println(qdto);
	
		boolean isS=CustomServiceImp.updateQna(qdto);
		if(isS) {
//			return "boarddetail.do";//viewresolver 실행됨
			return "redirect:qnadetail.do?seqparam="+qdto.getSeq();			
		}else {
			model.addAttribute("msg", "글수정실패");
			return "error";
		}
		
	}
	
}
