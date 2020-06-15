package com.nl.onl.daos;

import java.util.List;

import com.nl.onl.dtos.NoticeDto;
import com.nl.onl.dtos.QnaDto;

public interface ICustomDao{
//	QNA목록보기
	public List<QnaDto> getAllListQna(String pnum);
	
//	QNA페이징
	public int pcountQna();
	
//	QNA상세보기
	public QnaDto detailQna(String seq);
	
//	QNA쓰기
	public boolean insertQna(QnaDto qdto);
	
//	QNA수정
	public boolean updateQna(QnaDto qdto);
	
//	QNA삭제
	public boolean deleteQna(String seq);
	
//	공지사항목록보기
	public List<NoticeDto> getAllListNotice(String pnum);
	
//	공지사항 상세보기
	public NoticeDto detailNotice(String seq);
	
//	공지사항 쓰기
	public boolean insertNotice(NoticeDto ndto);
	
//	공지사항 수정
	public boolean updateNotice(NoticeDto ndto);
	
//	공지사항 삭제
	public boolean deleteNotice(NoticeDto ndto);
}
