package kr.co.cocean.mypage.service;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.LoginDAO;
import kr.co.cocean.mypage.dto.LoginDTO;



@Service
public class LoginService {
	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired LoginDAO dao;
	@Autowired PasswordEncoder encoder;
	



	public LoginDTO login(String userNum) {
		
		return dao.login(userNum);
	}




	public boolean getPw(String userNum, String password) {
		String enc_pw = dao.getPw(userNum);		
		return encoder.matches(password, enc_pw);
	}




	

	

	
	
	
	
/*
	public LoginDTO login(String userNum,String password) {
		String enc_pw = dao.getPw(userNum);		
		return encoder.matches(pw, enc_pw);
	}*/


	/*
	public LoginDTO login(String userNum, String password) {
<<<<<<< HEAD
		return dao.login(userNum,password);
	}
	
	
=======
		return dao.login(userNum,password );
	}*/



	
	
}
