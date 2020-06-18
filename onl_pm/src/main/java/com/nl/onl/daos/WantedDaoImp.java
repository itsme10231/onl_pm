package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.ApplyDto;
import com.nl.onl.dtos.CategoryDto;
import com.nl.onl.dtos.ReviewDto;
import com.nl.onl.dtos.SearchDto;
import com.nl.onl.dtos.WantedDto;
import com.nl.onl.dtos.WishDto;

@Repository
public class WantedDaoImp implements IWantedDao{
	
	@Autowired
	SqlSession sqlSession;
	
	private String nameSpace = "com.nl.onl.wanted.";

	@Override
	public List<WantedDto> getWantedList(SearchDto sdto) {
		return sqlSession.selectList(nameSpace+"getWantedList", sdto);
	}

	@Override
	public List<WantedDto> getWantedListLogin(SearchDto sdto) {
		return sqlSession.selectList(nameSpace+"getWantedListLogin", sdto);
	}

	@Override
	public List<WantedDto> getWantedDetail(String seq) {
		return sqlSession.selectList(nameSpace +"getWantedDetail", seq);
	}

	@Override
	public List<WantedDto> getWantedDetailLogin(Map<String, String> map) {
		return sqlSession.selectList(nameSpace +"getWantedDetailLogin", map);
	}

	@Override
	public boolean increaseView(String seq) {
		int isS = sqlSession.update(nameSpace +"increaseView", seq);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean insertWanted(WantedDto wdto) {
		int isS = sqlSession.insert(nameSpace +"insertWanted", wdto);
		return isS > 0 ? true:false;
	}

	@Override
	public List<CategoryDto> getCategory() {
		return sqlSession.selectList(nameSpace +"getCategory");
	}

	@Override
	public boolean updateWanted(WantedDto wdto) {
		int isS = sqlSession.update(nameSpace +"updateWanted", wdto);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean deleteWanted(String seq) {
		int isS = sqlSession.update(nameSpace +"deleteWanted", seq);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean insertApply(ApplyDto adto) {
		int isS = sqlSession.insert(nameSpace +"insertApply", adto);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean deleteApply(Map<String, String> map) {
		int isS = sqlSession.delete(nameSpace +"deleteApply", map);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean cancelSelector(Map<String, String> map) {
		int isS = sqlSession.update(nameSpace +"cancelSelector", map);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean pickSelector(Map<String, String> map) {
		int isS = sqlSession.update(nameSpace +"pickSelector", map);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean updateStatus(String seq) {
		int isS = sqlSession.update(nameSpace +"updateStatus", seq);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean insertReview(ReviewDto rdto) {
		int isS = sqlSession.insert(nameSpace +"insertReview", rdto);
		return isS > 0 ? true:false;
	}

	@Override
	public boolean deleteReview(String seq) {
		int isS = sqlSession.update(nameSpace +"deleteReview", seq);
		return isS > 0 ? true:false;
	}
	
	@Override
	public boolean insertWish(WishDto wdto) {
		int isS = sqlSession.insert(nameSpace +"insertWish", wdto);
		return isS > 0 ? true:false;
	}
	
	@Override
	public boolean delWishList(Map<String, String> map) {
		int isS = sqlSession.insert(nameSpace +"delWishList", map);
		return isS > 0 ? true:false;
	}
	

	
	@Override
	public List<WantedDto> getMyDoc(String id) {
		return sqlSession.selectList(nameSpace+"getMyDoc", id);
	}
}
