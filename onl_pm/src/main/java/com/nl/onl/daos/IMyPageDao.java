package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.WantedDto;

public interface IMyPageDao {

//	내가쓴글 전체보기(페이징)
	public List<WantedDto> getAllMyList(Map<String, String> map);
	
//	페이징
	public int pcount();
	
//	공고 상세보기
	public String detail(String id);
	
//	현재 활성화된 글 페이징
	public List<WantedDto> activation(Map<String, String> map);
	
//	기간이 만료된 글 페이징
	public List<WantedDto> expiration(Map<String, String> map);
	
//	내가 지원한 구인글 별 지원자 수 페이징
	public List<ApplyDto> myApplyCount(Map<String, String> map);
	
//	지원자 중 구직자 목록 페이징
	public int selector(Map<Integer, Integer> map);
	
//	구직자 취소
	public int changeSelector();
	
//	금액 변경
	public int changeSalary(Map<Integer, Integer> map);
	
//	지원 취소
	public int applyCancel();
	
//	모집 취소
	public int cancelWanted();
	
//	내 평가보기(평가한거) 페이징
	public String getReview(Map<String, String> map);
	
//	내 평가보기(평가받은거) 페이징
	public String receiveReview(Map<String, String> map);
	
//	찜글보기 페이징
	public String getWishlist(Map<String, String> map);
	
//	찜글삭제
	public int delWishlist();
	
//	유저리스트 페이징
	public String getUserlist(Map<String, String> map);
	
//	유저리스트 삭제
	public int delUserlist();
	
//	블랙/화이트리스트 변경
	public String changeUserlist(Map<String, String> map);
	
}
