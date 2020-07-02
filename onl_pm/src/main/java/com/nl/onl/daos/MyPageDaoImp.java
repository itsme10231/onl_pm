package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.UserlistDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

@Repository
public class MyPageDaoImp implements IMyPageDao{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.nl.onl.myPage.";
	
	@Override
	public List<WantedDto> getAllMyList(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"getAllMyList", map);
	}

	@Override
	public int pcount(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"pcount", map);
	}

	@Override
	public WantedDto detail(String id) {
		
		return sqlSession.selectOne(namespace+"detail", id);
	}

	@Override
	public List<WantedDto> activation(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"activation", map);
	}

	@Override
	public List<WantedDto> expiration(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"expiration", map);
	}

	@Override
	public List<WantedDto> myApplyCount(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"myApplyCount", map);
	}

	@Override
	public List<WantedDto> applylist(Map<String, String> map) {
		
		return sqlSession.selectList(namespace+"applylist", map);
	}
	
	@Override
	public boolean setSelector(Map<String, String> map) {
		int count = sqlSession.update(namespace+"setSelector", map);
		return count > 0? true:false;
	}

	@Override
	public boolean cancelSelector(String seq) {
		int count = sqlSession.update(namespace+"changeSelector", seq);
		return count > 0? true:false;
	}

	@Override
	public boolean changeSalary(Map<String, String> map) {
		int count = sqlSession.update(namespace+"changeSalary", map);
		return count > 0? true:false;
	}

	@Override
	public boolean applyCancel(String seq) {
		int count = sqlSession.delete(namespace+"applyCancel", seq);
		return count > 0? true:false;
	}

	@Override
	public boolean cancelWanted(String seq) {
		int count = sqlSession.update(namespace+"cancelWanted");
		return count > 0? true:false;
	}

	@Override
	public List<ReviewDto> getReview(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"getReview", map);
	}

	@Override
	public List<ReviewDto> receiveReview(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"receiveReview", map);
	}

	@Override
	public List<WishDto> getWishlist(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"getWishlist", map);
	}

	@Override
	public boolean delWishlist(String seq) {
		int count = sqlSession.update(namespace+"delWishlist", seq);
		return count > 0? true:false;
	}

	@Override
	public List<UserlistDto> getUserlist(Map<String, String> map) {
		
		return sqlSession.selectOne(namespace+"getUserlist", map);
	}

	@Override
	public boolean delUserlist(String seq) {
		int count = sqlSession.update(namespace+"delUserlist", seq);
		return count > 0? true:false;
	}

	@Override
	public boolean changeUserlist(Map<String, String> map) {
		int count = sqlSession.selectOne(namespace+"changeUserlist", map);
		return count > 0? true:false;
	}

}
