package kr.co.cocean.tank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.cocean.tank.service.TankService;

@Component
public class RecordGenerator {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	TankService service;
	
	@Scheduled(fixedRate = 7200000) // 2시간(7,200,000 밀리초)마다 실행
	public void recordGenerator() {
		List<Integer> tankCount = service.tankCount();
		logger.info("tankList: "+tankCount.toString());
		Random random = new Random();
		for (int i = 0; i < tankCount.size(); i++) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("tankID", tankCount.get(i));
				for (int j = 0; j < 9; j++) {
					int randomNumber = random.nextInt(101);
					map.put("num"+j, randomNumber);
				}
				logger.info("map"+map);
				service.recordData(map);
			// 이때 수치 비교 
		}
		
	}

}
