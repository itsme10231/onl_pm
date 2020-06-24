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
	public PayDto getAgree(String wanted_seq) {
		return sqlSession.selectOne(nameSpace+"getAgree", wanted_seq);
	}

	@Override
	public List<PayDto> forceSelect() {
		return sqlSession.selectList(nameSpace+"forceSelect");
	}

	@Override
	public boolean forceUpdate(List<PayDto> plist) {
		int count=sqlSession.update(nameSpace+"forceUpdate" ,plist);
		return count == plist.size() ? true:false;
	}

	@Override
	public List<ChargeDto> getPayment(Map<String, String> map) {
		return sqlSession.selectList(nameSpace+"getPayment", map);
	}
	
	@Override
	public int getPaging(String id) {
		return sqlSession.selectOne(nameSpace +"getPaging", id);
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
	
	@Override
	public List<ChargeDto> getWillBePayList(Map<String, String> map) {
		return sqlSession.selectList(nameSpace+"getWillBePayList", map);
	}
	
	@Override
	public List<ChargeDto> getWillBePayList2(String id) {
		return sqlSession.selectList(nameSpace+"getWillBePayList2", id);
	}
	
	@Override
	public ChargeDto getPaymentDetail(String seq) {
		return sqlSession.selectOne(nameSpace+"getPaymentDetail", seq);
	}
	
	@Override
	public String getAllbal(String id) {
		return sqlSession.selectOne(nameSpace+"getAllbal", id);
	}
}
