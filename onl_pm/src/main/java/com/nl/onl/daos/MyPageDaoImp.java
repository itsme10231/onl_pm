package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.WantedDto;

public class MyPageDaoImp implements IMyPageDao{

	@Override
	public List<WantedDto> getAllMyList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pcount(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WantedDto detail(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WantedDto> activation(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WantedDto> expiration(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WantedDto> myApplyCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WantedDto> applylist(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setSelector(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int changeSelector(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int changeSalary(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int applyCancel(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cancelWanted(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewDto> getReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewDto> receiveReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getWishlist(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delWishlist(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getUserlist(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delUserlist(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String changeUserlist(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	private String namespace = "com.nl.onl.mypage.";
//	
//	@Override
//	public List<WantedDto> getAllMyList(Map<String, String> map) {
//		
//		return sqlSession.selectList(namespace+"getAllMyList", map);
//	}
//
//	@Override
//	public String pcount(String id) {
//		
//		return sqlSession.selectOne(namespace+"pcount", id);
//	}
//
//	@Override
//	public String detail(String id) {
//		
//		return sqlSession.selectOne(namespace+"detail", id);
//	}
//
//	@Override
//	public List<WantedDto> activation(Map<String, String> map) {
//		
//		return sqlSession.selectList(namespace+"activation", map);
//	}
//
//	@Override
//	public List<WantedDto> expiration(Map<String, String> map) {
//		
//		return sqlSession.selectList(namespace+"expiration", map);
//	}
//
//	@Override
//	public List<ApplyDto> myApplyCount(Map<String, String> map) {
//		
//		return sqlSession.selectList(namespace+"myApplyCount", map);
//	}
//
//	@Override
//	public List<WantedDto> applylist(Map<String, String> map) {
//		
//		return sqlSession.selectList(namespace+"applylist", map);
//	}
//	
//	@Override
//	public int selector(Map<Integer, Integer> map) {
//		
//		return sqlSession.update(namespace+"selector", map);
//	}
//
//	@Override
//	public int changeSelector() {
//		
//		return sqlSession.update(namespace+"changeSelector");
//	}
//
//	@Override
//	public int changeSalary(Map<Integer, Integer> map) {
//		
//		return sqlSession.update(namespace+"changeSalary", map);
//	}
//
//	@Override
//	public int applyCancel() {
//		
//		return sqlSession.update(namespace+"applyCancel");
//	}
//
//	@Override
//	public int cancelWanted() {
//		
//		return sqlSession.update(namespace+"cancelWanted");
//	}
//
//	@Override
//	public String getReview(Map<String, String> map) {
//		
//		return sqlSession.selectOne(namespace+"getReview", map);
//	}
//
//	@Override
//	public String receiveReview(Map<String, String> map) {
//		
//		return sqlSession.selectOne(namespace+"receiveReview", map);
//	}
//
//	@Override
//	public String getWishlist(Map<String, String> map) {
//		
//		return sqlSession.selectOne(namespace+"getWishlist", map);
//	}
//
//	@Override
//	public int delWishlist() {
//		
//		return sqlSession.update(namespace+"delWishlist");
//	}
//
//	@Override
//	public String getUserlist(Map<String, String> map) {
//		
//		return sqlSession.selectOne(namespace+"getUserlist", map);
//	}
//
//	@Override
//	public int delUserlist() {
//		
//		return sqlSession.update(namespace+"delUserlist");
//	}
//
//	@Override
//	public String changeUserlist(Map<String, String> map) {
//		
//		return sqlSession.selectOne(namespace+"changeUserlist", map);
//	}

}
