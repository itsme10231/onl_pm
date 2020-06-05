package com.nl.onl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.ICustomDao;
import com.nl.onl.dtos.NoticeDto;
import com.nl.onl.dtos.QnaDto;

@Service
public class CustomServiceImp implements ICustomService{

	@Autowired ICustomDao CustomDao;
	
	@Override
	public List<QnaDto> getAllListQna(String pnum) {
		return CustomDao.getAllListQna(pnum);
	}

	@Override
	public QnaDto detailQna(String seq) {
		return CustomDao.detailQna(seq);
	}

	@Override
	public boolean insertQna(QnaDto qdto) {
		return CustomDao.insertQna(qdto);
	}

	@Override
	public boolean updateQna(QnaDto qdto) {
		return CustomDao.updateQna(qdto);
	}

	@Override
	public boolean deleteQna(String seq) {
		return CustomDao.deleteQna(seq);
	}

	@Override
	public List<NoticeDto> getAllListNotice(String pnum) {
		return CustomDao.getAllListNotice(pnum);
	}

	@Override
	public NoticeDto detailNotice(String seq) {
		return CustomDao.detailNotice(seq);
	}

	@Override
	public boolean insertNotice(NoticeDto ndto) {
		return CustomDao.insertNotice(ndto);
	}

	@Override
	public boolean updateNotice(NoticeDto ndto) {
		return CustomDao.updateNotice(ndto);
	}

	@Override
	public boolean deleteNotice(NoticeDto ndto) {
		return CustomDao.deleteNotice(ndto);
	}

}
