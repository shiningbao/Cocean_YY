package kr.co.cocean.tank.service;

import java.util.ArrayList;

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
	
	
	
	public ArrayList<TankDTO> tankList() {
		return dao.tankList();
	}

}
