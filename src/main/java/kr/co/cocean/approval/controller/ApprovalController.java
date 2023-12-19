package kr.co.cocean.approval.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.service.ApprovalService;

@Controller
public class ApprovalController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService service;
	
ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="/approval/formList.go")
	public ModelAndView formList() {
		
		ArrayList<ApprovalDTO> list = service.list();
		mav.addObject("list",list);
		mav.setViewName("approval/formList");
		logger.info("list:"+list);
		return mav;
	}
}
