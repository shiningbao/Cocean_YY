package kr.co.cocean.statistics.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.statistics.service.StatisticsService;

@Controller
public class StatisticsController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsService service;
	
	@GetMapping(value="/statistics/list.go")
	public ModelAndView statisticsList() {
		return service.statisticsList();
	}
	
}
