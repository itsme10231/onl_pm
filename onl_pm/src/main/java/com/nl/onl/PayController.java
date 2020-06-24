package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.MerchantDto;
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
	public String toWallet() {
		
		return "redirect:/prepaid.do";
	}
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/prepaid.do", method = {RequestMethod.GET})
	public String toPrepaid(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);
		
		List<ChargeDto> clist = paymentServiceImp.getPayment(map);
		int allP = paymentServiceImp.getPaging(map);
		System.out.println(allP);
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		
		model.addAttribute("clist", clist);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		return "prepaid";
	}
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/received.do", method = {RequestMethod.GET})
	public String toReceived(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		pnum = (pnum == null? "1":pnum);
		
		map.put("id", id);
		map.put("pnum", pnum);
		map.put("isReceived", "Y");
		
		List<ChargeDto> clist = paymentServiceImp.getPayment(map);
		int allP = paymentServiceImp.getPaging(map);
		
		Map<String, Integer> pageMap = onlUtil.pagingValue(allP, pnum, 5);
		
		model.addAttribute("clist", clist);
		model.addAttribute("allP", allP);
		model.addAttribute("pnum", pnum);
		model.addAllAttributes(pageMap);
		
		return "received";
	}
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/charge.do", method = {RequestMethod.GET})
	public String toCharge(Model model, Authentication auth, String pnum) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		String allbal = paymentServiceImp.getAllbal(id);
		
		model.addAttribute("allbal", allbal);
		
		return "charge";
	}
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/ajaxcharge.do", method = {RequestMethod.POST})
	public String doCharge(Model model, Authentication auth, String pay_method, String merchant_uid, String paid_amount, String apply_num) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		int pay_amountI = Integer.parseInt(paid_amount);
		
		ChargeDto cdto = new ChargeDto(0, id, pay_amountI, null, pay_amountI, null, "CHARGE");
		MerchantDto mdto = new MerchantDto(0, id, pay_method, merchant_uid, pay_amountI, apply_num);
		
		boolean isS = paymentServiceImp.insertPaymentT(cdto, mdto);
		
		if(isS) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
	
	@Secured({"ROLE_USER", "ROLE_ADMIN"})
	@RequestMapping(value = "/refund.do", method = {RequestMethod.GET})
	public String chargeRefund(Model model, Authentication auth, String seq) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("seq", seq);
		map.put("cancelflag", "Y");
		map.put("id", id);
		map.put("balance", "0");
		
		boolean isS = paymentServiceImp.updatePaymentT(map);
		
		if(isS) {
			model.addAttribute("msg", "성공적으로 환불되었습니다.");
		}else {
			model.addAttribute("msg", "환불에 실패했습니다. 관리자에게 문의해주세요");
		}
		
		
		return "redirect:/prepaid.do";
	}
	
}
