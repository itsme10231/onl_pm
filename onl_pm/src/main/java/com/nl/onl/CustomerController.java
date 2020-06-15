package com.nl.onl;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.nl.onl.dtos.QnaDto;
import com.nl.onl.service.ICustomService;

@Controller
public class CustomerController {
	
	@Autowired
	ICustomService CustomServiceImp;
	
	//QNA 전체목록
	@RequestMapping(value = "/qnalist.do", method = {RequestMethod.GET})
	public String qnalist(Model model,String pnum) {
		List<QnaDto> list = CustomServiceImp.getAllListQna(pnum);
		int count= CustomServiceImp.pcountQna();
		model.addAttribute("list",list);
//		model.addAttribute();
		return "qnalist";
	}
//	
//	//글추가폼 이동
//	@RequestMapping(value = "/addForm.do", method = RequestMethod.GET)
//	public String addForm(Locale locale, Model model) {
//		 // @RequestParam("seqparam"): "seqparam" 이름으로 파라미터가 전달되면 seq변수에 받겠다 
//		logger.info("글추가폼이동 {}.", locale);
//
//		return "qnaWrite";
//	}
//	
//	//QNA쓰기
//	
//	@RequestMapping(value = "qnaWrite.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String ansAddBoard(QnaDto qdto, Locale locale, Model model) {
//		 
//		logger.info("글추가하기 {}.", locale);
//		boolean isS=CustomServiceImp.insertQna(qdto);
//		if(isS) {
//			return "redirect:qnalist.do";			
//		}else {
//			model.addAttribute("msg", "글추가실패");
//			return "error";
//		}
//		
//	}

	
	
}
