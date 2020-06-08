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

	@Autowired private IAdminDao admindao;
	
	@Override
	public List<ReportDto> getAllListReport(String pnum) {
		return admindao.getAllListReport(pnum);
	}

	@Override
	public ReportDto detailReport(String seq) {
		return admindao.detailReport(seq);
	}

	@Override
	public boolean updateReport(Map<String, String> map) {
		return admindao.updateReport(map);
	}

	@Override
	public List<LoginDto> getAllListAdmin(String pnum) {
		return admindao.getAllListAdmin(pnum);
	}

	@Override
	public LoginDto detailAdmin(String id) {
		return admindao.detailAdmin(id);
	}

	@Override
	public boolean flagAdmin(Map<String, String> map) {
		return admindao.flagAdmin(map);
	}

}
