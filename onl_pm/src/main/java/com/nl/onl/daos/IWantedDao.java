package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

public interface IWantedDao {
	
	public List<WantedDto> getWantedList(SearchDto sdto);
	
	public List<WantedDto> getWantedListLogin(SearchDto sdto);
	
	//increaseView와 함께 트랜잭션 처리
	public List<WantedDto> getWantedDetail(String seq);
	
	public List<WantedDto> getWantedDetailLogin(Map<String, String> map);
	
	public boolean increaseView (String seq);
	
	
	//pay_agree 테이블 인서트와 함께 트랜잭션 처리
	public boolean insertWanted(WantedDto wdto);
	
	
	public List<CategoryDto> getCategory();
	
	public boolean updateWanted(WantedDto wdto);
	
	public boolean deleteWanted(String seq);
	
	

	
	public List<WantedDto> getMyDoc(String id);
	
	public boolean insertApply(ApplyDto adto);
	
	//트랜잭션 처리
	public boolean deleteApply(Map<String, String> map);
	public boolean cancelSelector(Map<String, String> map);
	
	
	public boolean pickSelector(Map<String, String> map);
	
	public boolean updateStatus(String seq);
	
	public boolean insertReview(ReviewDto rdto);
	
	public boolean deleteReview(String seq);
	
	public boolean insertWish(WishDto wdto);
}
