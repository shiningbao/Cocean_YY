package kr.co.cocean.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.alarm.dao.AlarmDAO;
import kr.co.cocean.alarm.dto.AlarmDTO;

@Service
public class AlarmService {
	
	@Autowired AlarmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	public HashMap<String, Object> getList(int employeeID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("alarmList", dao.getList(employeeID));
	
		return result;
	}
	
	
	
}
