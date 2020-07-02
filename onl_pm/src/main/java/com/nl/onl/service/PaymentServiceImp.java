package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IPaymentDao;
import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.BankCDto;
import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.MerchantDto;
import com.nl.onl.dtos.PayDto;

@Service
public class PaymentServiceImp implements IPaymentService{

	@Autowired
	private IPaymentDao paymentDaoImp;
	
	@Override
	public boolean insertAgree(Map<String, String> map) {
		return paymentDaoImp.insertAgree(map);
	}

	@Override
	public boolean deleteAgree(String seq) {
		return paymentDaoImp.deleteAgree(seq);
	}

	@Override
	public boolean updateAgreeT(Map<String, String> map) {
		//둘다 Y가 되었을 경우 ONL계정으로부터 출금결제 발생, 받는 이에게 거래기록 insert
		//map의 id는 agree, type, suggestion, wanted_seq, receive_id
		boolean isS = false;
		isS = paymentDaoImp.updateAgree(map);
		
		if(isS) {
			PayDto pdto = paymentDaoImp.getAgree(map.get("wanted_seq"));
			if(pdto.getOffer_agree().equals("Y") && pdto.getSearch_agree().equals("Y")) {
				ChargeDto cdto = new ChargeDto(0, pdto.getReceive_id(), pdto.getSuggestion(), null, 0, null, "RECEIVE");
				isS = paymentDaoImp.insertPayment(cdto);
			}
		}
		
		return isS;
	}

	@Override
	public PayDto getAgree(String seq) {
		return paymentDaoImp.getAgree(seq);
	}
	
	//강제지급
	@Override
	public boolean forceSelectT() {
		
		boolean isS = false;
		List<PayDto> plist = paymentDaoImp.forceSelect();
		
		if(plist != null && plist.size() != 0) {
			isS = paymentDaoImp.forceUpdate(plist);
			if(isS) {
				for(PayDto pdto:plist) {
					ChargeDto cdto = new ChargeDto(0, pdto.getReceive_id(), pdto.getSuggestion(), null, 0, null, "RECEIVE");
					isS = paymentDaoImp.insertPayment(cdto);
				}
			}
		}
		
		return isS;
	}


	@Override
	public List<ChargeDto> getPayment(Map<String, String> map) {
		return paymentDaoImp.getPayment(map);
	}
	
	@Override
	public int getPaging(Map<String, String> map) {
		return paymentDaoImp.getPaging(map);
	}

	@Override
	public boolean insertPaymentT(ChargeDto cdto, MerchantDto mdto) {
		
		boolean isS = paymentDaoImp.insertPayment(cdto);
		if(isS) {
			isS = paymentDaoImp.insertMerchant(mdto);
		}
		
		return isS;
	}

	@Override
	public boolean updatePaymentT(Map<String, String> map) {
		//map의 키: seq, balance, cancelflag, id
		ChargeDto orig = paymentDaoImp.getPaymentDetail(map.get("seq"));
		boolean isS = paymentDaoImp.updatePayment(map);
		
		int pay = orig.getBalance();
		ChargeDto cdto = new ChargeDto(0, map.get("id"), pay, null, pay, "N", "CANCEL");
		
		if(map.get("cancelflag") != null && orig.getCancelflag().equals("N")) {
			//환불일 경우
			cdto.setMoney(-1*cdto.getMoney());
			cdto.setBalance(-1*cdto.getBalance());
			cdto.setType("REFUND");
			cdto.setCancelflag("Y");
		}
		
		paymentDaoImp.insertPayment(cdto);
		
		return isS;
	}

	@Override
	public boolean payWantedT(Map<String, String> map) {
		//map의 키 : wanted_pay, id
//		List<ChargeDto> clist = paymentDaoImp.getWillBePayList(map);
//
//		boolean isS = false;
//		
//		if(clist != null && clist.size() != 0) {
//			
//			map.put("balance", "0");
//			int paid = Integer.parseInt(map.get("wanted_pay"));
//			
//			for(int i = 0; i < clist.size(); i++) {
//				
//				if(i == clist.size()-1) {
//					map.put("balance", (clist.get(i).getBalance()-paid)+"");
//				}
//				map.put("seq", clist.get(i).getSeq()+"");
//
//				
//				isS = paymentDaoImp.updatePayment(map);
//				paid -= clist.get(i).getBalance();
//			}
//			int pay = -1*Integer.parseInt(map.get("wanted_pay"));
//			
//			isS = paymentDaoImp.insertPayment(new ChargeDto(0, map.get("id"), pay, null, pay, "N", "PAY"));
//		}
		
		List<ChargeDto> clist = paymentDaoImp.getWillBePayList2(map.get("id"));
		int wanted_pay = Integer.parseInt(map.get("salary"));
		int pay = Integer.parseInt(map.get("salary"));
		
		boolean isS = false;
		
		if(clist != null && clist.size() != 0) {
			
			if(clist.get(clist.size()-1).getAllbal() < wanted_pay) {
				//입력한 금액보다 잔고가 적다면
				return isS;
			}else {
				
				int i = 0;
				while(wanted_pay > 0) {
					
					ChargeDto cdto = clist.get(i);
					int currBal = cdto.getBalance();
					
					if(wanted_pay < currBal) {
						wanted_pay = 0;
						cdto.setBalance(currBal -wanted_pay);
					}else {
						wanted_pay -= currBal;
						cdto.setBalance(0);
					}
					
					map.put("seq", cdto.getSeq()+"");
					map.put("balance", cdto.getBalance()+"");
					
					isS = paymentDaoImp.updatePayment(map);
					
					i++;
				}
				
				isS = paymentDaoImp.insertPayment(new ChargeDto(0, map.get("id"), pay, null, pay, "N", "PAY"));
			}
		}
//		
		return isS;
	}
	
	@Override
	public MerchantDto getMerchant(String seq) {
		return paymentDaoImp.getMerchant(seq);
	}
	
	@Override
	public String getAllbal(String id) {
		return paymentDaoImp.getAllbal(id);
	}
	
	@Override
	public List<BankCDto> getBankCode() {
		return paymentDaoImp.getBankCode();
	}
	
	@Override
	public String getSequence() {
		String seq = paymentDaoImp.getSequence();
		if(seq.length() < 9) {
			String zero = "";
			for(int i = 0; i < 9 -seq.length(); i++) {
				zero += "0";
			}
			seq = zero +seq;
		}
		return seq;
	}
	
	@Override
	public boolean insertAccount(AccountDto adto) {
		return paymentDaoImp.insertAccount(adto);
	}
	
	@Override
	public AccountDto getAccount(String id) {
		// TODO Auto-generated method stub
		return paymentDaoImp.getAccount(id);
	}
}
