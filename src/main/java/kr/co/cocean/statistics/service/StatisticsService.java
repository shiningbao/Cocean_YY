package kr.co.cocean.statistics.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.statistics.dao.StatisticsDAO;
import kr.co.cocean.statistics.dto.ProductHistoryDTO;
import kr.co.cocean.statistics.dto.TankHistoryDTO;
import kr.co.cocean.statistics.dto.TicketHistoryDTO;
import kr.co.cocean.statistics.dto.VisitorsHistoryDTO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsDAO dao;
	public ModelAndView statisticsList() {
		ModelAndView mav = new ModelAndView();
		
//		AnimalDTO animal = dao.animalHistory();
//		TankHistoryDTO tank = dao.tankHistory();
//		ProductHistoryDTO product = dao.productHistory();
//		TicketHistoryDTO ticket = dao.ticketHistroy();
//		VisitorsHistoryDTO visitors = dao.visitorsHistory();
//		// 복지사이트 추가 예정??
//		
//		mav.setViewName("statistics/statistics");
//		mav.addObject("tank",tank);
//		mav.addObject("animal",animal);
//		mav.addObject("product",product);
//		mav.addObject("ticket",ticket);
//		mav.addObject("visitors",visitors);
		return mav;
	}
	
	
}
