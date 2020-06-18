package com.nl.onl.service;

import java.util.List;
import java.util.Map;


import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

public interface IWantedService {

	public List<WantedDto> getWantedList(SearchDto sdto);
	
	public List<WantedDto> getWantedListLogin(SearchDto sdto);
	
	//increaseView와 함께 트랜잭션 처리
	public List<WantedDto> getWantedDetailT(String seq);
	
	public List<WantedDto> getWantedDetailLoginT(Map<String, String> map);
	
	public List<WantedDto> getMyDoc(String id);
	
	//파일업로드와 함께 트랜잭션 처리
	public boolean insertWantedT(WantedDto wdto, List<FileDto> flist);
	
	public List<CategoryDto> getCategory();
	
	public boolean updateWantedT(WantedDto wdto, List<FileDto> flist, String preLocation);
	
	public boolean deleteWanted(String seq);
	
	
	public boolean insertApply(ApplyDto adto);
	
	//트랜잭션 처리
	public boolean deleteApplyT(Map<String, String> map);
	
	//pay_agree 테이블 인서트와 함께 트랜잭션 처리
	public boolean pickSelectorT(Map<String, String> map);
	
	
	public boolean updateStatus(String seq);
	
	public boolean insertReview(ReviewDto rdto);
	
	public boolean deleteReview(String seq);
	
	public boolean insertWish(WishDto wdto);
	
	public boolean delWishList(Map<String, String> map);
}
