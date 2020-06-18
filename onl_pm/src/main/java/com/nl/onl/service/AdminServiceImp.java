package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IAdminDao;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;

@Service
public class AdminServiceImp implements IAdminService{

	@Autowired private IAdminDao adminDaoImp;
	
	@Override
	public List<ReportDto> getAllListReport(String pnum) {
		return adminDaoImp.getAllListReport(pnum);
	}

	@Override
	public ReportDto detailReport(String seq) {
		return adminDaoImp.detailReport(seq);
	}

	@Override
	public boolean updateReport(Map<String, String> map) {
		return adminDaoImp.updateReport(map);
	}

	@Override
	public List<LoginDto> getAllListAdmin(String pnum) {
		return adminDaoImp.getAllListAdmin(pnum);
	}

	@Override
	public LoginDto detailAdmin(String id) {
		return adminDaoImp.detailAdmin(id);
	}

	@Override
	public boolean flagAdmin(Map<String, String> map) {
		return adminDaoImp.flagAdmin(map);
	}

	@Override
	public List<ReportDto> getReportCategory() {
		return adminDaoImp.getReportCategory();
	}
	
	@Override
	public boolean insertReport(ReportDto rdto) {
		return adminDaoImp.insertReport(rdto);
	}
}
