package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nl.onl.dtos.FileDto;

@Repository
public class FileDaoImp implements IFileDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String nameSpace = "com.nl.onl.file.";
	
//	@Override
//	public boolean insertMultiFile(List<FileDto> list) {
//		int isS = sqlSession.insert(nameSpace +"insertMultiFile", list);
//		
//		return isS == list.size() ? true:false;
//	}

	@Override
	public boolean delFiles(String[] seqs) {
		int isS = sqlSession.update(nameSpace +"delFiles", seqs);
		
		return isS == seqs.length ? true:false;
	}

	@Override
	public List<FileDto> getFiles(Map<String, String> map) {
		
		return sqlSession.selectList(nameSpace+"getFiles", map);
	}
	
	@Override
	public boolean insertFile(FileDto fdto) {
		int isS = sqlSession.insert(nameSpace+"insertFile", fdto);
		return isS > 0 ? true:false;
	}
	
}
