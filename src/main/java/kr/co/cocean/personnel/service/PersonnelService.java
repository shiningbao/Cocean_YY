package kr.co.cocean.personnel.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.personnel.dao.PersonnelDAO;
import kr.co.cocean.personnel.dto.PersonnelDTO;

@Service
public class PersonnelService {
	@Autowired PersonnelDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public List<String> getResponsibility(String val) {
		
		return dao.getResponsibility(val);
	}
	public int join(HashMap<String, Object> params) {

		logger.info("join 서비스접근 "+ params.get("employeeID"));
		return dao.join(params);
	}
	public void addCallender(String perNum) {
		
		String myCallender = "내 일정(기본)";
		String rsvCallendar = "예약 일정(기본)";
		
		dao.addMyCallendar(perNum,myCallender);
		dao.addRsvCallendar(perNum,rsvCallendar);
	}
}
