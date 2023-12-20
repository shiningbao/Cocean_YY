package kr.co.cocean.statistics.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.statistics.dao.StatisticsDAO;

@Service
public class StatisticsService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsDAO dao;
	
	
}
