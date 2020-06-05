package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.PayDto;

@Repository
public class PaymentDaoImp implements IPaymentDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.nl.onl.payment.";
	
	
	@Override
	public boolean insertAgree(Map<String, String> map) {
		int count=sqlSession.insert(nameSpace+"insertAgree" ,map);
		return count>0?true:false;
	}

	@Override
	public boolean deleteAgree(String seq) {
		int count=sqlSession.delete(nameSpace+"deleteAgree" ,seq);
		return count>0?true:false;
	}

	@Override
	public boolean updateAgree(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"updateAgree" ,map);
		return count>0?true:false;
	}

	@Override
	public PayDto getAgree(String seq) {
		return sqlSession.selectOne(nameSpace+"getAgree", seq);
	}

	@Override
	public List<PayDto> forceSelect() {
		return sqlSession.selectList(nameSpace+"forceSelect");
	}

	@Override
	public boolean forceUpdate(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"forceUpdate" ,map);
		return count>0?true:false;
	}

	@Override
	public ChargeDto getPayment(String id) {
		return sqlSession.selectOne(nameSpace+"getPayment", id);
	}

	@Override
	public boolean insertPayment(ChargeDto CDto) {
		int count=sqlSession.insert(nameSpace+"insertPayment" ,CDto);
		return count>0?true:false;
	}

	@Override
	public boolean updatePayment(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"updatePayment" ,map);
		return count>0?true:false;
	}

}
