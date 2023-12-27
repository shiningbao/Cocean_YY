package kr.co.cocean.tank.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.tank.dao.TankDAO;
import kr.co.cocean.tank.dto.TankDTO;

@Service
public class TankService {
	
	@Autowired
	TankDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	
	public List<TankDTO> tankList(TankDTO tankDTO) {
		List<TankDTO> list = dao.tankList(tankDTO);
		return list;
	}



	public List<Map<String, Object>> getBranch() {
		return dao.getBranch();
	}



	public void tankWrite(Map<String, Object> params) {
		dao.tankReg(params);
		logger.info("tankID: "+params.get("tnakId"));
		// 관리 항목 값 넣어주기 
		
	}

}
