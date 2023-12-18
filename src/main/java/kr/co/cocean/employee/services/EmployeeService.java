package kr.co.cocean.employee.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.employee.dao.EmployeeDAO;

@Service
public class EmployeeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EmployeeDAO dao;

	public void home() {
		String home = dao.home();
		
	}
	
	
	
	
	
}
