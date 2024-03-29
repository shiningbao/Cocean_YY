package kr.co.cocean.tank.service;

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

		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("status", pager.getStatus());
		params.put("type", pager.getType());

		Integer total = dao.totalCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("totalCount: "+pager.getTotalCount());
		List<TankDTO> list = dao.tankList(params);
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
		dao.recordData(map); // 난수 수치 기록
	
	}

	public void nomal(Integer tankID) {
		dao.nomal(tankID);
	}



	public HashMap<String, Object> recentRecord(int tankID) {
		return dao.recentRecord(tankID);
	}


	public List<Map<String, Object>> getRecord(String tankID, String curDate) {
		return dao.recordList(tankID,curDate);
	}


	public int addPlan(HashMap<String, Object> params) {
		return dao.addPlan(params);

	}


	public List<Map<String, Object>> getPlan(HashMap<String, Object> params) {
		return dao.getPlan(params);
	}


	public int removePlan(int logID) {
		return dao.removePlan(logID);
	}


	public int donePlan(int logID) {
		return dao.donePlan(logID);
	}


	public HashMap<String, Object> getStandard(Integer tankID) {
		return dao.getStandard(tankID);
	}


	public void abNormal(HashMap<String, Object> chkValue) {
		dao.abNormal(chkValue);
		dao.tankStatus(chkValue);
		
	}


	public List<Map<String, Object>> getAbNomal(String tankID, String curDate) {
		return dao.getAbNomal(tankID, curDate);
	}

}
