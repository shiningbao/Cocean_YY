package kr.co.cocean.schedule.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.alarm.service.SseService;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired ScheduleService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/schedule/schedule.go")
	public String schedule() {
		logger.info("devtools1232132132131237777777777777777");

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
	public ModelAndView scheduleWrite(@RequestParam("requestType") String requestType,ScheduleDTO dto, HttpSession session,
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
			logger.info("일정등록요청@@@@@@@@@@@@@");
			dto.setBackgroundColor("#ABDEE6");
			dto.setSubCategory("개인");
			service.scheduleWrite(dto);
		}else if("facility".equals(requestType)){
			logger.info("시설예약요청@@@@@@@@@@@@@");
			dto.setBackgroundColor("#F3B0C3");
			service.facilityWrite(dto);
		}

		mav.setViewName("redirect:/schedule/schedule.go");

		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/schedule/getCallenderEvents.do")
	@ResponseBody
	public HashMap<String, Object> getCallenderEvents(HttpSession session) {
		logger.info("캘린더이벤트 추가 컨트롤러");
		LoginDTO userInfo  =(LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		List<HashMap<String,Object>> eventList = service.getCallenderEvents(employeeID);

		List<HashMap<String,Object>> facilityList = service.getFacilityEvents();

		HashMap<String, Object> result = new HashMap<>();
		result.put("eventList", eventList);
		result.put("facilityList", facilityList);
			logger.info("개인 일정%%%%"+eventList);



		logger.info("eventList=="+result);
		return result;
	}

	@RequestMapping(value="/schedule/getFacility.do")
	@ResponseBody
	public List<String> getFacility(@RequestParam String text) {
		logger.info("text=="+text);

		 List<String> getFacility = service.getFacility(text);

		return getFacility;
	}




	@PostMapping(value="/schedule/addCalender.do")
	@ResponseBody
	public int addCallender(@RequestParam String loginEmployeeID , @RequestParam String nodeText, @RequestParam String employeeID) {

		int firstIndex =nodeText.indexOf(' ');

		String nodeName = nodeText.substring(0,firstIndex);
		

		return service.addCalender(loginEmployeeID,nodeName,employeeID);

	}

	@PostMapping(value="/schedule/getAddCalender.do")
	@ResponseBody
	public List<HashMap<String, Object>> getAddCaldender(@RequestParam String loginEmployeeID){
		List<HashMap<String,Object>> addInterestCallender = service.addInterestCallender(loginEmployeeID);


		return addInterestCallender;
	}



	@PostMapping(value="/schedule/getAddCalList.do")
	@ResponseBody
	public HashMap<String, Object> getAddCalList(@RequestParam String val,@RequestParam String backgroundColor){

		List<HashMap<String,Object>> eventAddList = service.getAddCalList(val,backgroundColor);
		HashMap<String, Object> result = new HashMap<>();
		result.put("eventAddList", eventAddList);
		return result;
	}


	@RequestMapping(value="/schedule/getDetailWriteName.do")
	@ResponseBody
	public String getDetailWriteName(@RequestParam String id) {
		String name = service.getDetailWriteName(id);
		return name;
	}

	@PostMapping(value="/schedule/delMyCal.do")
	@ResponseBody
	public ModelAndView delMyCal(@RequestParam String id ) {
		int  row = service.delMyCal(id);


		return new ModelAndView("redirect:/schedule/schedule.go");
	}
	@PostMapping(value="/schedule/interestDelCalendar.do")
	@ResponseBody
	public String interestDelCalendar(@RequestParam String calendarID) {

		service.interestDelCalendar(calendarID);
		return "success";
	}

	@PostMapping(value="/schedule/updateCal.do")
	@ResponseBody
	public String updateCal(@RequestParam HashMap<String, Object> dataToSend) {

		String startDateStr = (String) dataToSend.get("startDate");
		String startTimeStr = (String) dataToSend.get("startTime");
		String endDateStr = (String) dataToSend.get("endDate");
		String endTimeStr = (String) dataToSend.get("endTime");


		dataToSend.put("start", startDateStr +" "+startTimeStr);
		dataToSend.put("end", endDateStr+" "+endTimeStr);

		logger.info("data =="+dataToSend);
		service.updateCal(dataToSend);


		return "success";
	}

	@Scheduled(cron = "0 */30 * * * *")
	public void scheduleAlarm() {
	    List<HashMap<String, Object>> result =service.scheduleAlarm();
	    logger.info("스케줄결과값 !! "+result);
	    if(result.size()>0) {

	    	SseService sse = new SseService();
	    	for (HashMap<String, Object> hashMap : result) {
	    		hashMap.put("url", "/schedule/schedule.go");


	    		String subCategory = (String) hashMap.get("subCategory");
	    		if(subCategory.equals("예약")) {
	    			hashMap.put("content", "예약 30분전입니다.");
	    		}else {
	    			hashMap.put("content", "일정 30분전입니다.");
	    		}

	    		sse.alarm( (int)hashMap.get("employeeID") ,(String) hashMap.get("content"),(String) hashMap.get("url"));

	    	}
	    	service.addalarm(result);

	    }

	    }



}
