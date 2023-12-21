package kr.co.cocean.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.AddressDTO;

@Mapper
public interface AddressDAO {
	
	//내부주소록 리스트
	ArrayList<AddressDTO> interioraddresslist(int userId, String page);
	//내부주소록 페이지
	int interioraddresspage(int userId);
	//외부주소록 저장
	int insert(HashMap<String, Object> params);
	
	
	

}
