package kr.co.cocean.personnel.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.personnel.dao.PersonnelDAO;

@Service
public class PersonnelService {
	@Autowired PersonnelDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
}
