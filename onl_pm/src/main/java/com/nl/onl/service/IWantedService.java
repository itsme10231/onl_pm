package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.WantedDto;

public interface IWantedService {

	public List<WantedDto> getWantedList(Map<String, String> map);
	
	public List<WantedDto> getWantedListLogin(Map<String, String> map);
	
	//increaseView와 함께 트랜잭션 처리
	public WantedDto getWantedDetail(String seq);
	
	public WantedDto getWantedDetailLogin(Map<String, String> map);
	
	
	
	//pay_agree 테이블 인서트와 함께 트랜잭션 처리
	public boolean insertWanted(WantedDto wdto, Map<String, String> map);
	
	
	public List<CategoryDto> getCategory();
	
	public boolean updateWanted(WantedDto wdto);
	
	public boolean deleteWanted(String seq);
	
	
	public boolean insertApply(ApplyDto adto);
	
	//트랜잭션 처리
	public boolean deleteApply(Map<String, String> map);
	
	
	public boolean pickSelector(Map<String, String> map);
	
	public boolean updateStatus(String seq);
	
	public boolean insertReview(ReviewDto rdto);
	
	public boolean deleteReview(String seq);
	
}