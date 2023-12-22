package kr.co.cocean.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.AddressDTO;

@Mapper
public interface AddressDAO {
	
	//내부주소록 페이지
	int interioraddresspage(int userId);
	
	
	
	//상세보기
	Object detail(HashMap<String, Object> params);
	
	//외부주소록 삭제
	void del(int userId);
	
	//통과
	//내부주소록 리스트
	ArrayList<AddressDTO> interioraddressBooklist();
	
	//외부주소록 저장
		int insert(HashMap<String, Object> params);


	//외부주소록 삭제	
		
	void del(String addressNumber);


	//외부주소록
	ArrayList<AddressDTO> list();


	// 삭제
	Object delete(String addressNumber);


	//상세
	AddressDTO detail(int addressNumber);
	

}
