package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.PayDto;
import com.nl.onl.service.IPaymentService;
import com.nl.onl.util.Util;

@Controller
public class PayController {
	
	@Autowired
	IPaymentService paymentServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/wallet.do", method = {RequestMethod.GET})
	public String toWallet(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);
		
		List<ChargeDto> clist = paymentServiceImp.getPayment(map);
		int allP = paymentServiceImp.getPaging(id);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		
		model.addAttribute("clist", clist);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		return "wallet";
	}
	
	@RequestMapping(value = "/refund.do", method = {RequestMethod.GET})
	public String chargeRefund(Model model, Authentication auth, String seq) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("seq", seq);
		map.put("cancelflag", "Y");
		map.put("id", id);
		map.put("balance", "0");
		
		paymentServiceImp.updatePaymentT(map);
		
		return "wallet";
	}
	
}
