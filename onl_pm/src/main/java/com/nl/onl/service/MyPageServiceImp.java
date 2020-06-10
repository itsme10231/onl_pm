package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IMyPageDao;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.UserlistDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

@Service
public class MyPageServiceImp implements IMyPageService{

	@Autowired
	private IMyPageDao mypageDaoImp;
	
	@Override
	public List<WantedDto> getAllMyList(Map<String, String> map) {
		
		return mypageDaoImp.getAllMyList(map);
	}

	@Override
	public int pcount(String id) {
		
		return mypageDaoImp.pcount(id);
	}

	@Override
	public WantedDto detail(String id) {
		
		return mypageDaoImp.detail(id);
	}

	@Override
	public List<WantedDto> activation(Map<String, String> map) {
		
		return mypageDaoImp.activation(map);
	}

	@Override
	public List<WantedDto> expiration(Map<String, String> map) {
		
		return mypageDaoImp.expiration(map);
	}

	@Override
	public List<WantedDto> myApplyCount(Map<String, String> map) {
		
		return mypageDaoImp.myApplyCount(map);
	}

	@Override
	public List<WantedDto> applylist(Map<String, String> map) {
		
		return mypageDaoImp.applylist(map);
	}

	@Override
	public boolean setSelector(Map<String, String> map) {
		
		return mypageDaoImp.setSelector(map);
	}

	@Override
	public boolean cancelSelector(String seq) {
		
		return mypageDaoImp.cancelSelector(seq);
	}

	@Override
	public boolean changeSalary(Map<String, String> map) {
		
		return mypageDaoImp.changeSalary(map);
	}

	@Override
	public boolean applyCancel(String seq) {
		
		return mypageDaoImp.applyCancel(seq);
	}

	@Override
	public boolean cancelWanted(String seq) {
		
		return mypageDaoImp.cancelWanted(seq);
	}

	@Override
	public List<ReviewDto> getReview(Map<String, String> map) {
		
		return mypageDaoImp.getReview(map);
	}

	@Override
	public List<ReviewDto> receiveReview(Map<String, String> map) {
		
		return mypageDaoImp.receiveReview(map);
	}

	@Override
	public List<WishDto> getWishlist(Map<String, String> map) {
		
		return mypageDaoImp.getWishlist(map);
	}

	@Override
	public boolean delWishlist(String seq) {
		
		return mypageDaoImp.delWishlist(seq);
	}

	@Override
	public List<UserlistDto> getUserlist(Map<String, String> map) {
		
		return mypageDaoImp.getUserlist(map);
	}

	@Override
	public boolean delUserlist(String seq) {
		
		return mypageDaoImp.delUserlist(seq);
	}

	@Override
	public boolean changeUserlist(Map<String, String> map) {
		
		return mypageDaoImp.changeUserlist(map);
	}

}
