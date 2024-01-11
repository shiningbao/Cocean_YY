package kr.co.cocean.statistics.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.statistics.dao.StatisticsDAO;
import kr.co.cocean.statistics.dto.AnimalHistoryDTO;
import kr.co.cocean.statistics.dto.SalesHistoryDTO;
import kr.co.cocean.statistics.dto.TankHistoryDTO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsDAO dao;
	public Map<String, Object> statisticsChart() {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AnimalHistoryDTO> animal = dao.animalHistory();
 		ArrayList<TankHistoryDTO> tank = dao.tankHistory();
		ArrayList<SalesHistoryDTO> product = dao.productHistory();
		ArrayList<SalesHistoryDTO> ticket = dao.ticketHistory();
		ArrayList<SalesHistoryDTO> visitors = dao.visitorsHistory();
		
		map.put("animal", animal);
		map.put("tank", tank);
		map.put("product", product);
		map.put("ticket", ticket);
		map.put("visitors", visitors);
		
//		model.addAttribute("animal",animal);
//		model.addAttribute("tank",tank);
//		model.addAttribute("product",product);
//		model.addAttribute("ticket",ticket);
//		model.addAttribute("visitors",visitors);
		return map;
	}
	
	
}
