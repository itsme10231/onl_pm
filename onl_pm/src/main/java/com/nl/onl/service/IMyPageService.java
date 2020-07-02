package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.UserlistDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

public interface IMyPageService {

public List<WantedDto> getAllMyList(Map<String, String> map);
	
//	페이징
	public int pcount(Map<String, String> map);
	
//	공고 상세보기
	public WantedDto detail(String id);
	
//	현재 활성화된 글 페이징
	public List<WantedDto> activation(Map<String, String> map);
	
//	기간이 만료된 글 페이징
	public List<WantedDto> expiration(Map<String, String> map);
	
//	내가 지원한 구인글 별 지원자 수 페이징
	public List<WantedDto> myApplyCount(Map<String, String> map);
	
//	지원자 중 구직자 목록 페이징
	public List<WantedDto> applylist(Map<String, String> map);
	
//	구직자 선택/변경
	public boolean setSelector(Map<String, String> map);
	
//	구직자 취소
	public boolean cancelSelector(String seq);
	
//	금액 변경
	public boolean changeSalary(Map<String, String> map);
	
//	지원 취소
	public boolean applyCancel(String seq);
	
//	모집 취소
	public boolean cancelWanted(String seq);
	
//	내 평가보기(평가한거) 페이징
	public List<ReviewDto> getReview(Map<String, String> map);
	
//	내 평가보기(평가받은거) 페이징
	public List<ReviewDto> receiveReview(Map<String, String> map);
	
//	찜글보기 페이징
	public List<WishDto> getWishlist(Map<String, String> map);
	
//	찜글삭제
	public boolean delWishlist(String seq);
	
//	유저리스트 페이징
	public List<UserlistDto> getUserlist(Map<String, String> map);
	
//	유저리스트 삭제
	public boolean delUserlist(String seq);
	
//	블랙/화이트리스트 변경
	public boolean changeUserlist(Map<String, String> map);
}
