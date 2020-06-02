package com.nl.onl.service;

import java.util.Map;


import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;


public interface ILoginService {
	//회원가입
		public int insertMember(LoginDto ldto);
		
		//아이디 중복검사
		public String checkId(String id);
		
		//로그인
		public LoginDto login(String id);
		
		//정보수정
		public int updateInfo(LoginDto ldto);
		
		//탈퇴 및 정지
		public int updateDelflag(String id);
		
		//회원정보 영구삭제
		public int deleteMember();
		
		//프로필 작성
		public int insertProfile(ProfileDto pdto);
		
		//프로필 보기
		public ProfileDto getProfile(String id);
		
		//프로필 수정
		public int updateProfile(ProfileDto pdto);
}
