package kr.co.cocean.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.service.ApprovalService;
import kr.co.cocean.mypage.dto.LoginDTO;

@Controller
public class ApprovalController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService service;
	
	@GetMapping(value="/approval/formList.go")
	public ModelAndView formList(HttpSession session,RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		if(dto!=null) {
			ArrayList<ApprovalDTO> list = service.list();
			mav.addObject("list",list);
			mav.setViewName("approval/formList");
		}else {
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		return mav;
	}
	

	@PostMapping(value="/approval/searchList.do")
	public ModelAndView formSearch(HttpSession session, @RequestParam List<String> keyword) {
		logger.info("keyword : {}", keyword);

		return service.formSearch(keyword);
	}
	
	@GetMapping(value="/approval/writeDraft.go")
	public ModelAndView writeDraftgo(@RequestParam String title) {
		ModelAndView mav = new ModelAndView();
		logger.info(title);
		
		ArrayList<ApprovalDTO> draftInfo = service.draftInfo();
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
	
	@PostMapping(value="/approval/writeDraft.do")
	public String writeDraft(HttpSession session, @RequestParam HashMap<String, String> param) {
		logger.info("params : {}", param);
		// service.write(param);
		return "approval/draft";
	}
	
	
}
