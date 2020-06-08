package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IPaymentDao;
import com.nl.onl.dtos.ChargeDto;
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
	public boolean updateAgree(Map<String, String> map) {
		//둘다 Y가 되었을 경우 ONL계정으로부터 출금결제 발생, 받는 이에게 거래기록 insert
		return paymentDaoImp.updateAgree(map);
	}

	@Override
	public PayDto getAgree(String seq) {
		return paymentDaoImp.getAgree(seq);
	}

	@Override
	public List<PayDto> forceSelect() {
		return paymentDaoImp.forceSelect();
	}

	@Override
	public boolean forceUpdate(Map<String, String> map) {
		return paymentDaoImp.forceUpdate(map);
	}

	@Override
	public ChargeDto getPayment(String id) {
		return paymentDaoImp.getPayment(id);
	}

	@Override
	public boolean insertPayment(ChargeDto cdto) {
		return paymentDaoImp.insertPayment(cdto);
	}

	@Override
	public boolean updatePayment(Map<String, String> map) {
		return paymentDaoImp.updatePayment(map);
	}

}
