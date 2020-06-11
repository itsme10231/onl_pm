package com.nl.onl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IFileDao;
import com.nl.onl.daos.IPaymentDao;
import com.nl.onl.daos.IWantedDao;
import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

@Service
public class WantedServiceImp implements IWantedService{
	
	@Autowired
	IWantedDao wantedDaoImp;
	
	@Autowired
	IPaymentDao paymentDaoImp;
	
	@Autowired
	IFileDao fileDaoImp;
	
	@Override
	public List<WantedDto> getWantedList(SearchDto sdto) {
		return wantedDaoImp.getWantedList(sdto);
	}

	@Override
	public List<WantedDto> getWantedListLogin(SearchDto sdto) {
		return wantedDaoImp.getWantedListLogin(sdto);
	}

	@Override
	public WantedDto getWantedDetailT(String seq) {
		WantedDto result = wantedDaoImp.getWantedDetail(seq);
		boolean isS = wantedDaoImp.increaseView(seq);
		return result;
	}

	@Override
	public WantedDto getWantedDetailLoginT(Map<String, String> map) {
		WantedDto result = wantedDaoImp.getWantedDetailLogin(map);
		boolean isS = wantedDaoImp.increaseView(map.get("seq"));
		return result;
	}

	@Override
	public boolean insertWantedT(WantedDto wdto, List<FileDto> flist) {
		boolean isS = wantedDaoImp.insertWanted(wdto);
		isS = fileDaoImp.insertMultiFile(flist);
		return isS;
	}

	@Override
	public List<CategoryDto> getCategory() {
		return wantedDaoImp.getCategory();
	}

	@Override
	public boolean updateWanted(WantedDto wdto) {
		return wantedDaoImp.updateWanted(wdto);
	}

	@Override
	public boolean deleteWanted(String seq) {
		return wantedDaoImp.deleteWanted(seq);
	}

	@Override
	public boolean insertApply(ApplyDto adto) {
		return wantedDaoImp.insertApply(adto);
	}

	@Override
	public boolean deleteApplyT(Map<String, String> map) {
		boolean isS = wantedDaoImp.deleteApply(map.get("seq"));
		wantedDaoImp.cancelSelector(map);
		return isS;
	}

	@Override
	public boolean pickSelectorT(Map<String, String> map) {
		//map의 key: seq, wanted_seq, salary
		boolean isS = paymentDaoImp.insertAgree(map);
		return wantedDaoImp.pickSelector(map);
	}

	@Override
	public boolean updateStatus(String seq) {
		return wantedDaoImp.updateStatus(seq);
	}

	@Override
	public boolean insertReview(ReviewDto rdto) {
		return wantedDaoImp.insertReview(rdto);
	}

	@Override
	public boolean deleteReview(String seq) {
		return wantedDaoImp.deleteReview(seq);
	}
	
	
	@Override
	public boolean insertWish(WishDto wdto) {
		return wantedDaoImp.insertWish(wdto);
	}
}
