package kr.co.cocean.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.AddressDAO;
import kr.co.cocean.mypage.dto.AddressDTO;

@Service
public class AddressService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired AddressDAO dao;
	
	public HashMap<String, Object> interioraddressBook(String page, int userId) {
		int pa = Integer.parseInt(page);
		int set = (pa*10)-10;
		ArrayList<AddressDTO> list =dao.interioraddresslist(userId,page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.interioraddresspage(userId);
		map.put("pages", pages);
		map.put("addressList", list);
		return map;
		
	}

	public String outsidejoin(HashMap<String, Object> params) {
		logger.info("서비스 도착");
		int row = dao.insert(params);		
		return row > 0 ? "외부주소록이 저장 되었습니다":"저장에 실패 했습니다.";
	}

	public Object detail(HashMap<String, Object> params) {
		return dao.detail(params);
	}
	
	

	
	
	
}
