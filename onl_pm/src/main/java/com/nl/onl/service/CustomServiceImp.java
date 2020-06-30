package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.ICustomDao;
import com.nl.onl.dtos.NoticeDto;
import com.nl.onl.dtos.QnaDto;

@Service
public class CustomServiceImp implements ICustomService{

	@Autowired ICustomDao customDaoImp;

	@Override
	public List<QnaDto> getAllListQna(String pnum, String qna_code) {
		return customDaoImp.getAllListQna(pnum, qna_code);
	}

	@Override
	public int pcountQna(String qna_code) {
		return customDaoImp.pcountQna(qna_code);
	}
	
	@Override
	public List<QnaDto> detailQna(String seq) {
		return customDaoImp.detailQna(seq);
	}

	@Override
	public boolean insertQna(QnaDto qdto) {
		return customDaoImp.insertQna(qdto);
	}

	@Override
	public boolean updateQna(QnaDto qdto) {
		return customDaoImp.updateQna(qdto);
	}

	@Override
	public boolean deleteQna(String seq) {
		return customDaoImp.deleteQna(seq);
	}
	
	@Override
	public boolean insertReplyQna(QnaDto rdto) {
		return customDaoImp.insertReplyQna(rdto);
	}

	@Override
	public boolean updateProcess(QnaDto qdto) {
		return customDaoImp.updateProcess(qdto);
	}
//	
	@Override
	public List<NoticeDto> getAllListNotice(String pnum) {
		return customDaoImp.getAllListNotice(pnum);
	}

	@Override
	public NoticeDto detailNotice(String seq) {
		return customDaoImp.detailNotice(seq);
	}

	@Override
	public boolean insertNotice(NoticeDto ndto) {
		return customDaoImp.insertNotice(ndto);
	}

	@Override
	public boolean updateNotice(NoticeDto ndto) {
		return customDaoImp.updateNotice(ndto);
	}

	@Override
	public boolean deleteNotice(NoticeDto ndto) {
		return customDaoImp.deleteNotice(ndto);
	}

}
