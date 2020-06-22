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
	public List<WantedDto> getWantedDetailT(String seq) {
		List<WantedDto> result = wantedDaoImp.getWantedDetail(seq);
		boolean isS = wantedDaoImp.increaseView(seq);
		return result;
	}

	@Override
	public List<WantedDto> getWantedDetailLoginT(Map<String, String> map) {
		List<WantedDto> result = wantedDaoImp.getWantedDetailLogin(map);
		boolean isS = wantedDaoImp.increaseView(map.get("seq"));
		return result;
	}

	@Override
	public boolean insertWantedT(WantedDto wdto, List<FileDto> flist) {

		boolean isS = wantedDaoImp.insertWanted(wdto);
		
		if(flist!=null && flist.size() != 0) {
			for(FileDto fdto:flist) {
				isS = fileDaoImp.insertFile(fdto);
			}
		}
		
		return isS;
	}

	@Override
	public List<CategoryDto> getCategory() {
		return wantedDaoImp.getCategory();
	}

	@Override
	public boolean updateWantedT(WantedDto wdto, List<FileDto> flist, String preLocation) {

		return wantedDaoImp.updateWanted(wdto);
	}

	@Override
	public boolean deleteWanted(String seq) {
		return wantedDaoImp.deleteWanted(seq);
	}

	@Override
	public boolean insertApplyT(ApplyDto adto) {
		return wantedDaoImp.insertApply(adto);
	}

	@Override
	public boolean deleteApplyT(Map<String, String> map) {
		//map의 key: id, wanted_seq
		boolean isS = wantedDaoImp.deleteApply(map);
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
	
	@Override
	public boolean delWishList(Map<String, String> map) {
		return wantedDaoImp.delWishList(map);
	}
	
	
	@Override
	public List<WantedDto> getMyDoc(String id) {
		return wantedDaoImp.getMyDoc(id);
	}
}
