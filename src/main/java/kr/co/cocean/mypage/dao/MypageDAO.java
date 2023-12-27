package kr.co.cocean.mypage.dao;



import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.MypageDTO;
@Mapper
public interface MypageDAO {

	//내정보
	ArrayList<MypageDTO> myInfo(int userId);
	//연차정보
	Map<String, Object> attendanceDraft(int userId);

	
	 
	
	
	
	
}

