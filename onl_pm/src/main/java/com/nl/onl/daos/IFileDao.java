package com.nl.onl.daos;

import java.util.List;
import java.util.Map;

import com.nl.onl.dtos.FileDto;

public interface IFileDao {
	
	public boolean insertMultiFile(List<FileDto> list);
	
	public boolean delFiles(String[] seqs);
	
	public List<FileDto> getFiles(Map<String, String> map);
	
}