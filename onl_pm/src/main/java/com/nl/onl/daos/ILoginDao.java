package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;
import com.nl.onl.dtos.WantedDto;


public interface ILoginDao {
	//회원가입
	public boolean insertMember(LoginDto ldto);
	
	//이메일 중복검사
	public String checkEmail(String email);
	
	//로그인
	public LoginDto login(String email);
	
	//정보수정
	public boolean updateInfo(LoginDto ldto);
	
	//탈퇴 및 정지
	public boolean updateDelflag(String id);
	
	//회원정보 영구삭제
	public boolean deleteMember();
	
	//프로필 작성
	public boolean insertProfile(ProfileDto pdto);
	
	//프로필 보기
	public ProfileDto getProfile(String id);
	
	//프로필 수정
	public boolean updateProfile(ProfileDto pdto);
	
	//찜글목록 가져오기
	public List<WantedDto> getWishList(Map<String, String> map);
	
	//지원글 시퀀스 목록 가져오기
	public List<String> getApplySeq(String id);
}
