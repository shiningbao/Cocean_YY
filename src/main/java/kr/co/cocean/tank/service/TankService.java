package kr.co.cocean.tank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.cocean.tank.dao.TankDAO;
import kr.co.cocean.tank.dto.Pager;
import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.dto.TankRecordDTO;

@Service
public class TankService {
	
	@Autowired
	TankDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	// 전체 수조 리스트
	public List<TankDTO> tankList(Pager pager) {
//		Long totalCount = dao.getTotalCount(pager);
		List<TankDTO> list = dao.tankList(pager);
		return list;
	}


	// 수조 등록 시 지점명 불러오기
	public List<Map<String, Object>> getBranch() {
		return dao.getBranch();
	}


	// 수조 등록 1-1 
	@Transactional
	public void tankWrite(Map<String, Object> params) {
		int key = dao.tankReg(params);
		logger.info("tankID: "+params);
		if(key != 0) {
			mngItem(params);
			inChargeTank(params);
		}		
	}
	// 수조 관리항목 등록 1-2
	private void inChargeTank(Map<String, Object> params) {
		dao.inChargeTank(params);
	}
	// 수조 담당자 등록 1-3
	private void mngItem(Map<String, Object> params) {
		dao.mngItem(params);
	}
 
	// 수조 상세보기
	public HashMap<String, Object> tankDetail(int tankID) {
		HashMap<String, Object> map = dao.tankDetail(tankID);
		String emName = dao.getEm(tankID);
		map.put("emName", emName);
		return map;
	}

	// 차트 데이터 가져오기
	public List<TankRecordDTO> getChart(String tankID, String recordDate) {
		return dao.getChart(tankID,recordDate);
	}


	public void tankSet(Map<String, Object> params) {
		dao.tankSet(params);
		
	}


	public List<Map<String, Object>> tankAnimal(int tankID) {
		return dao.tankAnimal(tankID);
	}


	public List<Integer> tankCount() {
		return dao.tankCount();
	}


	public void recordData(Map<String, Integer> map) {
		dao.recordData(map);
		
	}


//	public HashMap<String, Object> logForm(int tankID) {
//		return dao.logForm(tankID);
//	}


	public HashMap<String, Object> recentRecord(int tankID) {
		return dao.recentRecord(tankID);
	}


	public List<Map<String, Object>> getRecord(String tankID, String curDate) {
		return dao.recordList(tankID,curDate);
	}

}
