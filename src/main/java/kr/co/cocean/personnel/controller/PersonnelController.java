package kr.co.cocean.personnel.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.service.PersonnelService;
import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class PersonnelController {
	
	@Autowired PersonnelService service;
	@Autowired ScheduleService scService;
	Logger logger = LoggerFactory.getLogger(getClass());
	PersonnelDTO dto = new PersonnelDTO();
	
	@RequestMapping(value="/personnel/join.go")
	public String personnel() {
		
		return "personnel/personnel";
	}
	
	@GetMapping(value="/personnel/getTeams.do")
	@ResponseBody
	public List<ScheduleDTO> getTeams() {
		logger.info("인사등록 팀리스트 호출");
		List<ScheduleDTO> teams = scService.getTeams();

		return teams;
	}
}
