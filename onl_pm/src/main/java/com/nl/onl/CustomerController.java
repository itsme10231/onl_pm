package com.nl.onl;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.page.Paging;
import com.nl.onl.daos.LoginDaoImp;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.QnaDto;
import com.nl.onl.service.ICustomService;

@Controller
public class CustomerController {
	
	@Autowired
	ICustomService CustomServiceImp;
	
	//QNA 전체목록
	@RequestMapping(value = "/qnalist.do", method = {RequestMethod.GET})
	public String qnalist(Model model,String pnum,String qna_code) {
		if (pnum==null) {
			pnum="1";
		}
		
		List<QnaDto> list = CustomServiceImp.getAllListQna(pnum,qna_code);
		int count= CustomServiceImp.pcountQna(qna_code);
		Map<String, Integer>map=Paging.pagingValue(count, pnum, 5);
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		
		return "qnalist";
	}
	
	//QNA상세보기
	@RequestMapping(value = "/qnadetail.do", method = RequestMethod.GET)
	public String qnadetail(QnaDto qdto, Authentication auth, Locale locale, Model model, @RequestParam("seqparam") String seq) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);
		LoginDto uDto = (LoginDto)auth.getPrincipal();
		List<QnaDto> qList=CustomServiceImp.detailQna(seq);
		
		System.out.println("출력 ! "+auth.getPrincipal());
		System.out.println("출력 2! "+ qList);
		
		if(uDto.getRole().equals("ADMIN")) {
			if (qList.get(0).getProcess().equals("WAIT")) {
				
				qdto.setSeq(Integer.parseInt(seq));
				qdto.setProcess("CHECKED");
				CustomServiceImp.updateProcess(qdto);
			}
			
		}
		model.addAttribute("qList",qList);
		System.out.println(qList);
		return "qnadetail";
	}
	
	
	//글쓰기폼 이동
	@RequestMapping(value = "/addForm.do", method = RequestMethod.GET)
	public String addForm(Locale locale, Model model) {
		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);
//		if () {
//			
//		}
		return "qnawrite";
	}
	
	//QNA쓰기
	
	@RequestMapping(value = "qnawrite.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnawrite(QnaDto qdto, Locale locale, Model model) {
		 
//		logger.info("글추가하기 {}.", locale);
		qdto.setId("O1");
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
			return "redirect:qnalist.do?pnum=1";
		}else {
			model.addAttribute("msg", "글삭제실패");
			return "error";
		}
		
	}
	//QNA수정폼 이동
	@RequestMapping(value = "/updateQna.do", method = RequestMethod.GET)
	public String updateForm(@RequestParam("seq") String seq,Locale locale, Model model) {
		 // @RequestParam("seq"): "seq" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
	
		
		List<QnaDto> qdto=CustomServiceImp.detailQna(seq);
		
		model.addAttribute("qlist", qdto);
		 System.out.println(qdto);
		return "qnaupdate";
	}
	//QNA수정
	@RequestMapping(value = "qnaUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaUpdate(QnaDto qdto, Locale locale, Model model) {
//		 System.out.println(qdto);
//	    if (seq1!=null) {
//			qdto.setSeq(Integer.parseInt(seq1));
//		}
		
		boolean isS=CustomServiceImp.updateQna(qdto);
		if(isS) {
			return "redirect:qnadetail.do?seqparam="+qdto.getSeq();
		}else {
			model.addAttribute("msg", "글수정실패");
			return "error";
		}
		
	}

	
	//QNA댓글쓰기
	@RequestMapping(value = "replyQna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insertReplyQna(QnaDto rdto, Locale locale, Model model) {
		System.out.println(rdto);
		
		boolean isS=CustomServiceImp.insertReplyQna(rdto);
		if(isS) {
			rdto.setProcess("COMPLETE");
			System.out.println("success");
			CustomServiceImp.updateProcess(rdto);
			return "redirect:qnadetail.do?seqparam="+rdto.getSeq();
		}else {
			model.addAttribute("msg", "글추가실패");
			return "error";
		}
		
	}
	
	//QNA댓글수정
	@RequestMapping(value = "qnaReplyUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaReplyUpdate(QnaDto qdto, Locale locale, Model model,String seq1) {
		 System.out.println("1번 "+qdto);
		int seq=qdto.getSeq();
		System.out.println("2번 "+seq);
		System.out.println("3번 "+seq1);
			qdto.setSeq(Integer.parseInt(seq1));
			qdto.setTitle("답글");
		boolean isS=CustomServiceImp.updateQna(qdto);
		if(isS) {
			return "redirect:qnadetail.do?seqparam="+seq;
		}else {
			model.addAttribute("msg", "글수정실패");
			return "error";
		}
		
	}
	
}
