package kr.co.cocean.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.InaddressDTO;
import kr.co.cocean.mypage.dto.OutAddressDTO;

@Mapper
public interface AddressDAO {

	ArrayList<OutAddressDTO> list();

	int delete(String addressNumber);

	ArrayList<OutAddressDTO> namesearch(List<String> name);
	
	//외부주소록 저장
	int insert(HashMap<String, Object> params);
	
	//내부주소록 페이지
	/*
	int interioraddresspage(int userId);
	
	
	
	//상세보기
	Object detail(HashMap<String, Object> params);
	
	//외부주소록 삭제
	void del(int userId);
	
	//통과
	//내부주소록 리스트
	ArrayList<OutAddressDTO> interioraddressBooklist();
	
	



	//외부주소록
	ArrayList<OutAddressDTO> list();


	// 삭제
	Object delete(int addressNumber);


	//내부주소록
	ArrayList<InaddressDTO> inlist();



	OutAddressDTO detail(String addressNumber);


	//지울거
	ArrayList<OutAddressDTO> list(String addressNumber);


	//수정
	int update(HashMap<String, Object> params);
*/


	
	

}
