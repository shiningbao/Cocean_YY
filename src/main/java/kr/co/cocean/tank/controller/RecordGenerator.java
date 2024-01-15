package kr.co.cocean.tank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.cocean.tank.service.TankService;

@Component
@EnableScheduling
public class RecordGenerator {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	TankService service;

//	@Scheduled(fixedRate = 3600000) // 2시간(7,200,000 밀리초)마다 실행/일단 지금은 1시간으로 테스트 중
//	public void recordGenerator() {
//		logger.info("스케줄러 작동");
//		String[] atr = {"recordMercury","recordWaterLevel","recordSalinity","recordPh",
//					"recordDo","recordNitrates","recordNitrites","recordAmmonia","recordPhosphates"};
//		
//		String[] standardAtr = {"mercury","waterLevel","salinity","pH",
//				"dO","nitrates","nitrites","ammonia","phosphates"};
//		
//		List<Integer> tankCount = service.tankCount(); // 상태가 폐쇄가 아닌 수조 리스트 가져오기
//		//logger.info("tankList: "+tankCount.toString());
//		
//		Random random = new Random();
//		int flag = 0;
//		for (int i = 0; i < tankCount.size(); i++) {
//			Map<String, Integer> map = new HashMap<String, Integer>();
//			map.put("tankID", tankCount.get(i));
//			HashMap<String, Object> standard = service.getStandard(tankCount.get(i)); // 수조 기준 수치 가져오기
//			int val = random.nextInt(10)+1; // 1~10 난수 생성, 7이면 기준 수치보다 5까지 크거나 작음/그 외 숫자는 정상 범주 이내 수치 기록
//			logger.info("1~10 랜덤: "+val);
//			int chk = val == 7 ? 6 : 4;
//			flag = 0;
//			// logger.info("chk: "+chk);
//				for (int j = 0; j < 9; j++) {
//					
//					String item = standardAtr[j];
//					int obj = Integer.parseInt((String) standard.get(item));
//					// logger.info("obj: "+obj);
//					int max = obj+chk;
//					int min = obj == 0 ? obj : obj-chk;
//					// logger.info("max: "+max+"min: "+min);
//					int randomNumber = random.nextInt(max-min+1)+min;
//					map.put(atr[j], randomNumber);
//					if(randomNumber > obj+5 || randomNumber < obj-5) { // 난수값이 기준 수치보다 5이상 크거나 작을 때 
//						HashMap<String, Object> chkValue = new HashMap<String, Object>();
//						chkValue.put("tankID", standard.get("tankID"));
//						chkValue.put("item", standardAtr[j]);
//						chkValue.put("value", randomNumber);
//						service.abNormal(chkValue);
//					}else {
//						flag++;
//					}
//				}
//				
//				service.recordData(map);
//				// logger.info("stat: "+flag);
//				if(flag == 9) {
//					service.nomal(map.get("tankID"));
//				}
//		}
//
//	}

}
