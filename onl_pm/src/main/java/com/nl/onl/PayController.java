package com.nl.onl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.BankCDto;
import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.MerchantDto;
import com.nl.onl.dtos.PayDto;
import com.nl.onl.service.IPaymentService;
import com.nl.onl.util.IamportREST;
import com.nl.onl.util.OpenBanking;
import com.nl.onl.util.Util;

@Controller
public class PayController {
	
	@Autowired
	IPaymentService paymentServiceImp;
	
	@Autowired
	Util onlUtil;
	
	@Autowired
	OpenBanking openBanking;
	
	@Autowired
	IamportREST impRest;
	
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
	@ResponseBody
	public String doCharge(Model model, Authentication auth, String pay_method, String imp_uid, String merchant_uid, String paid_amount, String apply_num) {
		boolean isS = false;
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		
		int pay_amountI = Integer.parseInt(paid_amount);
		int charge_amount = calCharge(pay_amountI);
		
		MerchantDto mdto = new MerchantDto(0, id, pay_method, merchant_uid, pay_amountI, apply_num, imp_uid);
		ChargeDto cdto = new ChargeDto(0, id, charge_amount, null, charge_amount, null, "CHARGE");
		System.out.println(cdto);
		System.out.println(mdto);
		
		isS = paymentServiceImp.insertPaymentT(cdto, mdto);
		
		if(isS) {
			return "SUCCESS";
		}else {
			impRest.getRefund(imp_uid, merchant_uid, "결제정보 저장 오류");
			return "FAIL";
		}
		
	}
	
	public int calCharge(int paid_amount) {
		
		if(paid_amount >= 10000) {
			paid_amount = (int) (paid_amount*1.01);
		}else if(paid_amount >= 100000){
			paid_amount = (int) (paid_amount*1.02);
		}else if(paid_amount >= 500000) {
			paid_amount = (int) (paid_amount*1.03);
		}else if(paid_amount >= 1000000) {
			paid_amount = (int) (paid_amount*1.04);
		}
		
		return paid_amount;
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
		
		MerchantDto mdto = paymentServiceImp.getMerchant(seq);
		
		boolean isS = impRest.getRefund(mdto.getImp_uid(), mdto.getMerchant_uid(), "사용자 요청 환불");
		
		if(isS) {
			isS = paymentServiceImp.updatePaymentT(map);
			model.addAttribute("msg", "성공적으로 환불되었습니다.");
		}else {
			model.addAttribute("msg", "환불에 실패했습니다. 관리자에게 문의해주세요");
		}
		
		
		return "redirect:/prepaid.do";
	}
	
	@RequestMapping(value = "/getbank.do", method = {RequestMethod.GET})
	@ResponseBody
	public JSONArray getBankCode() {
		
		List<BankCDto> blist = paymentServiceImp.getBankCode();
		
		JSONArray jArr = onlUtil.toJArr(blist);
		
		return jArr;
	}
	
	@RequestMapping(value = "/insertaccount.do", method = {RequestMethod.POST})
	@ResponseBody
	public String insertAccount(Model model, Authentication auth, String code, String account_num, String identity) {
		
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		String id = ldto.getId();
		String name = ldto.getName();
		
		boolean isS = openBanking.isRealAccount(identity, code, account_num, name);
		
		if(isS) {
			isS = paymentServiceImp.insertAccount(new AccountDto(id, code, account_num, ldto.getName()));
			if(isS) {
				
				//회원정보를 새로고침
				ldto.setHasacc("Y");
				Authentication newAuth = new UsernamePasswordAuthenticationToken(ldto, auth.getCredentials(), auth.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(newAuth);
				
				return "success";
				
			}else {
				return "fail_1";
			}
		}else {
			return "fail_2";
		}
		
	}
	
}
