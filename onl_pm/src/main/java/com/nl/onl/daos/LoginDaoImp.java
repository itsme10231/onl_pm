package com.nl.onl.daos;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;

@Repository
public class LoginDaoImp implements ILoginDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.nl.onl.login.";
	
	
	@Override
	public int insertMember(LoginDto ldto) {
		return sqlSession.insert(nameSpace+"insertMember", ldto);
	}

	@Override
	public String checkId(String id) {
		return sqlSession.selectOne(nameSpace+"checkId", id);
	}

	@Override
	public LoginDto login(String id) {
		return sqlSession.selectOne(nameSpace+"login", id);
	}

	@Override
	public int updateInfo(LoginDto ldto) {
		return sqlSession.update(nameSpace+"updateInfo",ldto);
	}

	@Override
	public int updateDelflag(String id) {
		return sqlSession.update(nameSpace+"updateDelflag", id);
	}

	@Override
	public int deleteMember() {
		return sqlSession.delete(nameSpace+"deleteMember");
	}

	@Override
	public int insertProfile(ProfileDto pdto) {
		return sqlSession.insert(nameSpace+"insertProfile", pdto);
	}

	@Override
	public ProfileDto getProfile(String id) {
		return sqlSession.selectOne(nameSpace+"getProfile", id);
	}

	@Override
	public int updateProfile(ProfileDto pdto) {
		return sqlSession.update(nameSpace+"updateProfile", pdto);
	}

}
