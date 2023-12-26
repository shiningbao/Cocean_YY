package kr.co.cocean.schedule.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.mypage.dto.LoginDTO;
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
	
	
	
	@GetMapping(value="/schedule/getCallender.do")
	@ResponseBody
	public List<ScheduleDTO> getCallender(@RequestParam String loginEmployeeID) {
		logger.info("로그인 사번 :"+loginEmployeeID);
		logger.info("스케줄컨트롤러 도착!!!!!!!!!!!!!!!!!!!");
		List<ScheduleDTO> myCallenders = service.getCallender(loginEmployeeID);

		return myCallenders;
	}
	
	@PostMapping(value = {"/schedule/scheduleWrite.do", "/schedule/facility.do"})
	public ModelAndView scheduleWrite(@RequestParam(required = false) String requestType,ScheduleDTO dto, HttpSession session,
			@RequestParam String start,@RequestParam String startTime,
			@RequestParam String end, @RequestParam String endTime) {
		logger.info("write 정보" +dto.getTitle());
		ModelAndView mav = new ModelAndView();
		LoginDTO userInfo  =(LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		dto.setEmployeeID(employeeID);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime startDateTime = LocalDateTime.parse(start+ " "+ startTime, formatter);
		LocalDateTime endDateTime = LocalDateTime.parse(end+ " "+ endTime, formatter);
		dto.setStart(startDateTime.toString());
		dto.setEnd(endDateTime.toString());
		
		if("scheduleWrite".equals(requestType)) {
			dto.setSubCategory("개인");
			service.scheduleWrite(dto);
		}else {
			dto.setBackgroundColor("#FF82FF");
			service.facilityWrite(dto);
		}
		
		mav.setViewName("redirect:/schedule/schedule.go");
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/schedule/getCallenderEvents.do")
	@ResponseBody
	public List<HashMap<String, Object>> getCallenderEvents(HttpSession session,@RequestParam Boolean isChecked) {
		logger.info("캘린더이벤트 추가 컨트롤러");
		LoginDTO userInfo  =(LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		List<HashMap<String,Object>> eventList = new ArrayList<HashMap<String,Object>>();
		if(isChecked) {
			
			eventList = service.getCallenderEvents(employeeID);
		}else {
			
		}
		
		logger.info("eventList=="+eventList);
		return eventList;
	}
	
	@RequestMapping(value="/schedule/getFacility.do")
	@ResponseBody
	public List<String> getFacility(@RequestParam String text) {
		logger.info("text=="+text);
			
		 List<String> getFacility = service.getFacility(text);
		
		return getFacility;
	}
	
	
//	@RequestMapping(value="/schedule/facility.do")
//	public ModelAndView facilityWrite(ScheduleDTO dto, @Request) {
//		ModelAndView mav = new ModelAndView("redirect:/schedule/schedule.go");
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		LocalDateTime startDateTime = LocalDateTime.parse(start+ " "+ startTime, formatter);
//		LocalDateTime endDateTime = LocalDateTime.parse(end+ " "+ endTime, formatter);
//		dto.setStart(startDateTime.toString());
//		dto.setEnd(endDateTime.toString());
//		return mav;
//	}
	
	
		
	
}
