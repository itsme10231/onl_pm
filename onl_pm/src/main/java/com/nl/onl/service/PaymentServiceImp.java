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
	private IPaymentDao PaymentDao;
	
	@Override
	public boolean insertAgree(Map<String, String> map) {
		return PaymentDao.insertAgree(map);
	}

	@Override
	public boolean deleteAgree(String seq) {
		return PaymentDao.deleteAgree(seq);
	}

	@Override
	public boolean updateAgree(Map<String, String> map) {
		return PaymentDao.updateAgree(map);
	}

	@Override
	public PayDto getAgree(String seq) {
		return PaymentDao.getAgree(seq);
	}

	@Override
	public List<PayDto> forceSelect() {
		return PaymentDao.forceSelect();
	}

	@Override
	public boolean forceUpdate(Map<String, String> map) {
		return PaymentDao.forceUpdate(map);
	}

	@Override
	public ChargeDto getPayment(String id) {
		return PaymentDao.getPayment(id);
	}

	@Override
	public boolean insertPayment(ChargeDto CDto) {
		return PaymentDao.insertPayment(CDto);
	}

	@Override
	public boolean updatePayment(Map<String, String> map) {
		return PaymentDao.updatePayment(map);
	}

}
