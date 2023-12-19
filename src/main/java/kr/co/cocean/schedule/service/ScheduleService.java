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
	public List<ScheduleDTO> getTeams() {
		
		return dao.getTeams();
	}

}
