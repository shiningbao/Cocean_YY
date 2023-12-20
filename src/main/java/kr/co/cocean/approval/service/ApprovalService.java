package kr.co.cocean.approval.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;

@Service
public class ApprovalService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public ArrayList<ApprovalDTO> list() {
		
		return dao.list();
	}

	public ModelAndView formSearch(List<String> keyword) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ApprovalDTO> list = dao.formSearch(keyword);
		mav.addObject("list",list);
		mav.setViewName("approval/formList");
		return mav;
	}

	public ArrayList<ApprovalDTO> draftInfo() {
		return dao.draftInfo();
	}

}
