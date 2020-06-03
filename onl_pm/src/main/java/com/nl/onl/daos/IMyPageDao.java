package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.WantedDto;

public interface IMyPageDao {

//	내가쓴글 전체보기(페이징)
	public List<WantedDto> getAllMyList(Map<String, String> map);
	
//	페이징
	public String pcount(String id);
	
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
	public int setSelector(Map<String, Integer> map);
	
//	구직자 취소
	public int changeSelector(int seq);
	
//	금액 변경
	public int changeSalary(Map<String, Integer> map);
	
//	지원 취소
	public int applyCancel(int seq);
	
//	모집 취소
	public int cancelWanted(int seq);
	
//	내 평가보기(평가한거) 페이징
	public List<ReviewDto> getReview(Map<String, String> map);
	
//	내 평가보기(평가받은거) 페이징
	public List<ReviewDto> receiveReview(Map<String, String> map);
	
//	찜글보기 페이징
	public String getWishlist(Map<String, String> map);
	
//	찜글삭제
	public int delWishlist(int seq);
	
//	유저리스트 페이징
	public String getUserlist(Map<String, String> map);
	
//	유저리스트 삭제
	public int delUserlist(int seq);
	
//	블랙/화이트리스트 변경
	public String changeUserlist(Map<String, String> map);

	
	
}
