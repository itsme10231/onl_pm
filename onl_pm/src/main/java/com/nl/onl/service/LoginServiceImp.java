package com.nl.onl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.nl.onl.daos.IFileDao;
import com.nl.onl.daos.ILoginDao;
import com.nl.onl.dtos.FileDto;
import com.nl.onl.dtos.LoginDto;
import com.nl.onl.dtos.ProfileDto;
import com.nl.onl.dtos.WantedDto;

@Service
public class LoginServiceImp implements ILoginService{
	
	@Autowired
	private ILoginDao loginDaoImp;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private IFileDao fileDaoImp;
//	
//	@Override
//	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//		UserDetails ud = loginDaoImp.login(email);
//		System.out.println("ud: "+ ud.getUsername());
//		return ud;
//	}

	@Override
	public boolean insertMember(LoginDto ldto) {
		String encodedPw = passwordEncoder.encode(ldto.getPassword());
		
		ldto.setPassword(encodedPw);
		return loginDaoImp.insertMember(ldto);
	}

	@Override
	public String checkEmail(String email) {
		return loginDaoImp.checkEmail(email);
	}

	@Override
	public LoginDto login(String email) {
		return loginDaoImp.login(email);
	}

	@Override
	public boolean updateInfo(LoginDto ldto) {
		return loginDaoImp.updateInfo(ldto);
	}

	@Override
	public boolean updateDelflag(String id) {
		return loginDaoImp.updateDelflag(id);
	}

	@Override
	public boolean deleteMember() {
		return loginDaoImp.deleteMember();
	}

	@Override
	public boolean insertProfileT(ProfileDto pdto, List<FileDto> flist) {
		boolean isS = loginDaoImp.insertProfile(pdto);
		if(flist!=null && flist.size() != 0) {
			for(FileDto fdto:flist) {
				isS = fileDaoImp.insertFile(fdto);
			}
		}
		return isS;
	}

	@Override
	public ProfileDto getProfile(String id) {
		return loginDaoImp.getProfile(id);
	}

	@Override
	public boolean updateProfile(ProfileDto pdto) {
		return loginDaoImp.updateProfile(pdto);
	}
	
	@Override
	public List<WantedDto> getWishList(Map<String, String> map) {
		return loginDaoImp.getWishList(map);
	}
	
	@Override
	public List<String> getApplySeq(String id) {
		return loginDaoImp.getApplySeq(id);
	}
}
