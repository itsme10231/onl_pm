package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.AccountDto;
import com.nl.onl.dtos.BankCDto;
import com.nl.onl.dtos.ChargeDto;
import com.nl.onl.dtos.MerchantDto;
import com.nl.onl.dtos.PayDto;

public interface IPaymentService {


//	구인글 매칭시 지급동의
	public boolean insertAgree(Map<String, String> map);
 
//	지원자 변경, 구인취소시 지급동의 테이블 삭제
	public boolean deleteAgree(String seq);
	
//	지급동의서 update(지급제안): 패러미터는 구인구직 식별자, 동의여부, 제안금액
	public boolean updateAgreeT(Map<String, String> map);
	
//	지급제안 보기
	public PayDto getAgree(String seq);
	
//	한쪽이 Y면서 최종수정일이 7일 이상인경우 자동결제
	public boolean forceSelectT();

	
//	예치금 잔액 및 거래내역 조회
	public List<ChargeDto> getPayment(Map<String, String> map);
	
	//예치금 전체페이지
	public int getPaging(Map<String, String> map);
	
//	예치금 기록 생성
	public boolean insertPaymentT(ChargeDto CDto, MerchantDto mdto);
	
//	예치금 기록 변동
	public boolean updatePaymentT(Map<String, String> map);
	
//	구인글 예치금 결제
	public boolean payWantedT(Map<String, String> map);
	
	//매칭시 구인글 취소
//	public boolean cancelWantedT(Map<String, String> map);
	
	//잔액조회: 거래기록이 없을시 null을 반환
	public String getAllbal(String id);
	
	public List<BankCDto> getBankCode();
	
	public String getSequence();
	
	public boolean insertAccount(AccountDto adto);
	
	public MerchantDto getMerchant(String seq);
}
