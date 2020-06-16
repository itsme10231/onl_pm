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
	
	//글추가폼 이동
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

	
	
}
