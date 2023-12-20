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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired ScheduleService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/schedule/schedule.go")
	public String schedule() {
		
		return "schedule/schedule";
	}
	
	@GetMapping(value="/schedule/getTeams.do")
	@ResponseBody
	public List<String> getTeams() {
		logger.info("중분류 팀선택 팀리스트 호출");
		List<String> teams = service.getTeams();

		return teams;
	}
	
	@GetMapping(value="/schedule/getCallender.do")
	@ResponseBody
	public List<ScheduleDTO> getCallender(@RequestParam String loginEmployeeID) {
		logger.info("로그인 사번 :"+loginEmployeeID);
		logger.info("스케줄컨트롤러 도착!!!!!!!!!!!!!!!!!!!");
		List<ScheduleDTO> myCallenders = service.getCallender(loginEmployeeID);

		return myCallenders;
	}
	
	@RequestMapping(value="/schedule/scheduleWrite.do")
	public ModelAndView scheduleWrite(ScheduleDTO dto) {
		logger.info("write 정보" +dto.getTitle());
		ModelAndView mav = new ModelAndView("/schedule/schedule");
		service.scheduleWrite(dto);
		mav.addObject("msg", "일정 등록 완료");
		return mav;
	}
	
		
	
}
