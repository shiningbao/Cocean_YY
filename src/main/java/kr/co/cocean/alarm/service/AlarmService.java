package kr.co.cocean.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.alarm.dao.AlarmDAO;
import kr.co.cocean.alarm.dto.AlarmDTO;

@Service
public class AlarmService {
	
	@Autowired AlarmDAO dao;
	@Autowired SseService sse;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	public HashMap<String, Object> getList(int employeeID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("alarmList", dao.getList(employeeID));
	
		return result;
	}


	public HashMap<String, Object> del(int employeeID, int historyID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		dao.del(historyID);
		result.put("alarmList", dao.getList(employeeID));
		return result;
	}


	public HashMap<String, Object> allDel(int employeeID) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		dao.allDel(employeeID);
		result.put("alarmList", dao.getList(employeeID));
		return result;
	}
	
	
	
	
	
}
