package kr.co.cocean.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired ScheduleService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="schedule/schedule.go")
	public String schedule() {
		
		return "schedule/schedule";
	}
	
	@GetMapping(value="schedule/getTeams.do")
	@ResponseBody
	public List<ScheduleDTO> getTeams() {
		logger.info("중분류 팀선택 팀리스트 호출");
		List<ScheduleDTO> teams = service.getTeams();

		return teams;
	}
	
}
