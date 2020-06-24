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
import com.nl.onl.dtos.ChargeDto;
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
		//map의 key: id, wanted_seq, wanted_author, salary
		boolean isS = wantedDaoImp.deleteApply(map);
		isS = wantedDaoImp.cancelSelector(map);
		
		//+선정된 지원자의 지원이었을시 지급동의 테이블 삭제, 구인글 지불금액 환불, 구인글 상태 WANTED 로 업데이트
		if(isS) {
			int pay = Integer.parseInt(map.get("salary"));
			
			paymentDaoImp.deleteAgree(map.get("wanted_seq"));
			paymentDaoImp.insertPayment(new ChargeDto(0, map.get("wanted_author"), pay, null, pay, "N", "CANCEL"));
			
			map.put("seq", map.get("wanted_seq"));
			map.put("state", "WANTED");
			
			isS = wantedDaoImp.updateStatus(map);
			
		}
		
		return isS;
	}

	@Override
	public boolean pickSelectorT(Map<String, String> map) {
		//map의 key: seq, wanted_seq, salary, isNull
		//+ isNull: 직전의 선택자가 null이었을 경우에만 지급동의 테이블 인서트
		boolean isS = wantedDaoImp.pickSelector(map);
		
		if(map.get("isNull").equals("Y")) {
			paymentDaoImp.insertAgree(map);
		}
		
		//paymentServiceImp의 payWantedT와 같이 실행할것!
		return isS;
	}

	@Override
	public boolean updateStatus(Map<String, String> map) {
		return wantedDaoImp.updateStatus(map);
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
