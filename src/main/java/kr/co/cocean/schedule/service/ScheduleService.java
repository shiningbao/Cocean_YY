package kr.co.cocean.schedule.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.schedule.dao.ScheduleDAO;
import kr.co.cocean.schedule.dto.ScheduleDTO;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public List<String> getTeams() {
		
		return dao.getTeams();
	}
	public List<ScheduleDTO> getCallender(String loginEmployeeID) {
		logger.info("나의 캘린더 가져오기 서비스 접근");
		return dao.getCallender(loginEmployeeID);
	}
	public void scheduleWrite(ScheduleDTO dto) {
		dao.scheduleWrite(dto);
	}

}
