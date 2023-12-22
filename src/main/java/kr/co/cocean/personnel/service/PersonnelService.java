package kr.co.cocean.personnel.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.personnel.dao.PersonnelDAO;
import kr.co.cocean.personnel.dto.PersonnelDTO;

@Service
public class PersonnelService {
	@Autowired PersonnelDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public int join(HashMap<String, Object> params) {

		logger.info("join 서비스접근 "+ params.get("employeeID"));
		return dao.join(params);
	}
	public List<String> getBranch() {
		return dao.getBranch();
	}
	
	
	
	public List<String> getBranchID(String branchID) {
		// TODO Auto-generated method stub
		return dao.getBranchID(branchID);
	}
	public List<String> getHqID(String hqID) {
		return dao.getHqID(hqID);
	}
	public List<String> getDepartmentText(String departmentText) {
		return dao.getDepartmentText(departmentText);
	}
	
}
