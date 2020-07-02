package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;

public interface IAdminDao{
	
//	신고목록보기
	public List<ReportDto> getAllListReport(String pnum);
	
//	신고 페이징처리
	public int pcountReport();
	
//	신고상세보기
	public ReportDto detailReport(String seq);
	
//	신고 처리하기
	public boolean updateReport(Map<String, String> map);
	
//	관리자페이지 회원전체목록
	public List<LoginDto> getAllListAdmin(String pnum);
	
//	관리자페이지 회원전체목록 페이징
	public int pcountAdmin();
	
//	관리자 페이지 상세보기
	public List<LoginDto> detailAdmin(String id);
	
//	관리자 페이지 회원 제재하기
	public boolean updateDel(Map<String, String> map);
	
//	관리자 페이지 회원 활동/정지 기능
	public boolean flagAdmin(Map<String, String> map);
	
	
	public boolean insertReport(ReportDto rdto);
	
	
	public List<ReportDto> getReportCategory();
	
}
