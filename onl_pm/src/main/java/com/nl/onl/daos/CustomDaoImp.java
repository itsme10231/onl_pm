package com.nl.onl.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.NoticeDto;
import com.nl.onl.dtos.QnaDto;

@Repository
public class CustomDaoImp implements ICustomDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.nl.onl.custom.";
	
	
	@Override
	public List<QnaDto> getAllListQna(String pnum,String qna_code) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("pnum",pnum );
		map.put("qna_code", qna_code);
		return sqlSession.selectList(nameSpace+"getAllListQna", map);
	}
	
	@Override
	public int pcountQna(String qna_code) {
		return sqlSession.selectOne(nameSpace+"pcountQna", qna_code);
	}

	@Override
	public List<QnaDto> detailQna(String seq) {
		return sqlSession.selectList(nameSpace+"detailQna", seq);
	}

	@Override
	public boolean insertQna(QnaDto qdto) {
		int count=sqlSession.insert(nameSpace+"insertQna", qdto);
		return count>0?true:false;
	}

	@Override
	public boolean updateQna(QnaDto qdto) {
		int count=sqlSession.update(nameSpace+"updateQna", qdto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteQna(String seq) {
		int count=sqlSession.delete(nameSpace+"deleteQna", seq);
		return count>0?true:false;
	}

	@Override
	public boolean insertReplyQna(QnaDto rdto) {
		int count=sqlSession.insert(nameSpace+"insertReplyQna",rdto);
		return count>0?true:false;
	}
	
	@Override
	public boolean updateProcess(QnaDto qdto) {
		int count=sqlSession.update(nameSpace+"updateProcess",qdto);
		return count>0?true:false;
	}
	
	@Override
	public List<NoticeDto> getAllListNotice(String pnum) {
		return sqlSession.selectList(nameSpace+"getAllListNotice", pnum);
		
	}

	@Override
	public NoticeDto detailNotice(String seq) {
		return sqlSession.selectOne(nameSpace+"detailNotice", seq);
	}

	@Override
	public boolean insertNotice(NoticeDto ndto) {
		int count=sqlSession.insert(nameSpace+"insertNotice", ndto);
		return count>0?true:false;
	}

	@Override
	public boolean updateNotice(NoticeDto ndto) {
		int count=sqlSession.update(nameSpace+"updateNotice", ndto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteNotice(NoticeDto ndto) {
		int count=sqlSession.delete(nameSpace+"deleteNotice", ndto);
		return count>0?true:false;
	}

}
