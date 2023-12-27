package kr.co.cocean.mypage.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.MypageDAO;
import kr.co.cocean.mypage.dto.MypageDTO;

@Service
public class MypageService {

	@Autowired MypageDAO dao;

	public HashMap<String, Object> myInfo(int userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> attendanceDraft = new HashMap<String, Object>();
		ArrayList<MypageDTO> myInfo = dao.myInfo(userId);
		attendanceDraft = dao.attendanceDraft(userId);
		map.put("attendanceDraft", attendanceDraft);
		map.put("myInfo", myInfo);
		return map;
	}

	
	
	
  

}
