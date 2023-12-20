package kr.co.cocean.mypage.service;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.LoginDAO;
import kr.co.cocean.mypage.dto.LoginDTO;



@Service
public class LoginService {
	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired LoginDAO dao;

	public LoginDTO login(String userNum, String password) {
		return dao.login(userNum,password);
	}
	
	
	
	
}
