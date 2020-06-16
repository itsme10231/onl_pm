package com.nl.onl.daos;


import java.util.List;

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
	public boolean insertMember(LoginDto ldto) {
		return sqlSession.insert(nameSpace+"insertMember", ldto) > 0? true:false;
	}

	@Override
	public String checkEmail(String email) {
		return sqlSession.selectOne(nameSpace+"checkEmail", email);
	}

	@Override
	public LoginDto login(String email) {
		return sqlSession.selectOne(nameSpace+"login", email);
	}

	@Override
	public boolean updateInfo(LoginDto ldto) {
		return sqlSession.update(nameSpace+"updateInfo",ldto) > 0? true:false;
	}

	@Override
	public boolean updateDelflag(String id) {
		return sqlSession.update(nameSpace+"updateDelflag", id) > 0? true:false;
	}

	@Override
	public boolean deleteMember() {
		return sqlSession.delete(nameSpace+"deleteMember") > 0? true:false;
	}

	@Override
	public boolean insertProfile(ProfileDto pdto) {
		return sqlSession.insert(nameSpace+"insertProfile", pdto) > 0? true:false;
	}

	@Override
	public ProfileDto getProfile(String id) {
		return sqlSession.selectOne(nameSpace+"getProfile", id);
	}

	@Override
	public boolean updateProfile(ProfileDto pdto) {
		return sqlSession.update(nameSpace+"updateProfile", pdto) > 0? true:false;
	}
	
	@Override
	public List<String> getWishList(String id) {
		return sqlSession.selectList(nameSpace+"getWishList", id);
	}
	
	@Override
	public List<String> getApplySeq(String id) {
		return sqlSession.selectList(nameSpace+"getApplySeq", id);
	}
}
