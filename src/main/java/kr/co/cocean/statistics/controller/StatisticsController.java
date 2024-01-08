package kr.co.cocean.statistics.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.statistics.service.StatisticsService;

@Controller
public class StatisticsController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsService service;
	
	@GetMapping(value="/statistics/list.go")
	public String statisticsList() {
		logger.info("통계페이지 이동");
		return "statistics/statistics";
	}
	
	@GetMapping(value="/statistics/chart.do")
	@ResponseBody
	public Map<String, Object> statisticsChart(){
		logger.info("통계 데이터 가져오기");
		return service.statisticsChart();
	}
}
