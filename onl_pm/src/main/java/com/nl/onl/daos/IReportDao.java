package com.nl.onl.daos;

import java.util.List;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;

public interface IReportDao {
	//관리자 신고내역보기
	public List<ReportDto> getAllListReport(String pnum);
	
	//관리자 신고내역 페이징
	public int pcountReport(String pnum);
	
	//관리자 신고글 상세보기
	public List<ReportDto> detailReport(String seq);
	
	//관리자 신고 처리하기
	public boolean processReport(ReportDto rdto);
	
	//회원 전체보기
//	public List<> getAllListReportPage(String pnum);
	
	//회원 신고내역 상세보기
	
	
	//회원 정지,활동 기능
	public boolean delMember(LoginDto ldto);
	
	
}
