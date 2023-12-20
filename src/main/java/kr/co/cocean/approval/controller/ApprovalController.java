package kr.co.cocean.approval.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.service.ApprovalService;

@Controller
public class ApprovalController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService service;
	
	@GetMapping(value="/formList.go")
	public ModelAndView formList() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<ApprovalDTO> list = service.list();
		mav.addObject("list",list);
		mav.setViewName("approval/formList");
		logger.info("list:"+list);
		return mav;
	}
	

	@PostMapping(value="/searchList.do")
	public ModelAndView formSearch(@RequestParam List<String> keyword) {
		logger.info("keyword : {}", keyword);

		return service.formSearch(keyword);
	}
	
	@GetMapping(value="/writeDraft.go")
	public ModelAndView writeDraft(@RequestParam String title) {
		ModelAndView mav = new ModelAndView();
		logger.info(title);
		
		ApprovalDTO draftInfo = service.draftInfo();
		mav.addObject("draftInfo",draftInfo);
		mav.setViewName("approval/workDraft");
		
		return mav;
	}
	
//	@GetMapping(value="writeDraft/.do")
//	public ModelAndView writeDraftForm() {
//		
//		ArrayList<ApprovalDTO> list = service.list();
//		mav.addObject("list",list);
//		mav.setViewName("approval/formList");
//		logger.info("list:"+list);
//		return mav;
//	}
	
	
}
