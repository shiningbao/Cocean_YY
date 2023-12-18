package kr.co.cocean.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.cocean.employee.services.EmployeeService;

@Controller
public class EmployeeController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmployeeService service;
	
	@GetMapping(value = "/")
	public String home() {
		service.home();
		logger.info("asdasd테스트");
		return "home";
	}
	
	
	
}
