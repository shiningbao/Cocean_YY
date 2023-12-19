package kr.co.cocean.approval.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;

@Service
public class ApprovalService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public ArrayList<ApprovalDTO> list() {
		
		return dao.list();
	}
}
