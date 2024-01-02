package kr.co.cocean.statistics.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.statistics.dao.StatisticsDAO;
import kr.co.cocean.statistics.dto.SalesHistoryDTO;
import kr.co.cocean.statistics.dto.TankHistoryDTO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsDAO dao;
	public ModelAndView statisticsList() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AnimalDTO> animal = dao.animalHistory();
		ArrayList<TankHistoryDTO> tank = dao.tankHistory();
		ArrayList<SalesHistoryDTO> product = dao.productHistory();
		ArrayList<SalesHistoryDTO> ticket = dao.ticketHistory();
		ArrayList<SalesHistoryDTO> visitors = dao.visitorsHistory();
		// 복지사이트 추가 예정??
		
		mav.setViewName("statistics/statistics");
		mav.addObject("animal",animal);
		mav.addObject("tank",tank);
		mav.addObject("product",product);
		mav.addObject("ticket",ticket);
		mav.addObject("visitors",visitors);
		return mav;
	}
	
	
}
