package kr.co.cocean.alarm.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.alarm.service.AlarmService;
import kr.co.cocean.mypage.dto.LoginDTO;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService service;
	
	@PostMapping(value = "/alarm/getList")
	@ResponseBody
	public HashMap<String, Object> getList(HttpSession session) {
		
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int employeeID = userInfo.getEmployeeID();
		
		return service.getList(employeeID);
	}
}
