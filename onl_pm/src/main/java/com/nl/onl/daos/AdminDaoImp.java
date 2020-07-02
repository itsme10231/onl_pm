package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ReportDto;

@Repository
public class AdminDaoImp implements IAdminDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.nl.onl.admin.";
	
	@Override
	public List<ReportDto> getAllListReport(String pnum) {
		return sqlSession.selectList(nameSpace+"getAllListReport", pnum);
	}

	@Override
	public int pcountReport() {
		return sqlSession.selectOne(nameSpace+"pcountReport");
	}
	
	@Override
	public ReportDto detailReport(String seq) {
		return sqlSession.selectOne(nameSpace+"detailReport", seq);
	}

	@Override
	public boolean updateReport(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"updateReport", map);
		return count>0?true:false;
	}

	@Override
	public List<LoginDto> getAllListAdmin(String pnum) {
		return sqlSession.selectList(nameSpace+"getAllListAdmin", pnum);
	}
	
	@Override
	public int pcountAdmin() {
		return sqlSession.selectOne(nameSpace+"pcountAdmin");
	}

	@Override
	public List<LoginDto> detailAdmin(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+"detailAdmin", id);
	}

	@Override
	public boolean updateDel(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"updateDel", map);
		return count>0?true:false;
	}
	
	@Override
	public boolean flagAdmin(Map<String, String> map) {
		int count=sqlSession.update(nameSpace+"flagAdmin", map);
		return count>0?true:false;
	}
	
	@Override
	public List<ReportDto> getReportCategory() {
		return sqlSession.selectList(nameSpace+"getReportCategory");
	}
	
	@Override
	public boolean insertReport(ReportDto rdto) {
		int count=sqlSession.update(nameSpace+"insertReport", rdto);
		return count>0?true:false;
	}

}
