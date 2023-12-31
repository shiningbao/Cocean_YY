package kr.co.cocean.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.cocean.mypage.dto.MypageDTO;

@Mapper
public interface MypageDAO {
	//리스트 가져오기
	ArrayList<MypageDTO> myInfo(int userId);

	//암호화 비밀번호 조회
	String pwCheck(int employeeID);
	//비밀번호 수정
	Object pwUpdate(String memberId, String hashedPw);

	
	
	String selectEncpw(@Param("rm") int rm);

	int changepw(HashMap<String, Object> params);
	
	
	

}
