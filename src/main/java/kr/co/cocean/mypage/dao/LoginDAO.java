package kr.co.cocean.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.LoginDTO;

@Mapper
public interface LoginDAO {



	LoginDTO login(String userNum);

	String getPw(String userNum);




	/*
	LoginDTO login(String userNum, String password);
*/



    /*
	LoginDTO login(String userNum, String password);
     */



}
