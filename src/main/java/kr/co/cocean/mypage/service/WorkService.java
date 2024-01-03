package kr.co.cocean.mypage.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.AddressDAO;
import kr.co.cocean.mypage.dao.WorkDAO;
import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Service
public class WorkService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkDAO dao;


	

	public Map<String, Object> worklist(String pfirstSearchDate, String plastSearchDate, int userId) {
		ArrayList<WorkDTO> workdto = dao.worklist(pfirstSearchDate,plastSearchDate,userId);
		Map<String, Object>map= new HashMap<String, Object>();
		map.put("work", workdto);
		return map;
	}




	public String gowork(int userId, Timestamp gotime) {
		
		return dao.gowork(userId,gotime);
	}



	
}
