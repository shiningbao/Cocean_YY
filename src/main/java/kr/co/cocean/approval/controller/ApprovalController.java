package kr.co.cocean.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		return mav;
	}
	

	@PostMapping(value="/approval/searchList.do")
	public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr, @RequestParam List<String> keyword) {
		logger.info("keyword : {}", keyword);

		return service.formSearch(session, rAttr, keyword);
	}
	
	@GetMapping(value="/approval/writeDraft.go")
	public ModelAndView writeDraftgo(HttpSession session,RedirectAttributes rAttr,  @RequestParam String title) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		logger.info(title);
		if(dto!=null) {
			int employeeID = dto.getEmployeeID();
			logger.info("사번:"+employeeID);
			ArrayList<ApprovalDTO> draftInfo = service.draftInfo(employeeID);
			mav.addObject("draftInfo",draftInfo);
			mav.addObject("title",title);
			mav.setViewName("approval/writeDraftForm");
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
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
	public ModelAndView writeDraft(MultipartFile[] files, HttpSession session, RedirectAttributes rAttr, @RequestParam HashMap<String, String> param) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		if(dto!=null) {
			int employeeID = dto.getEmployeeID();
		    param.put("employeeID", String.valueOf(employeeID));
		    logger.info("params : {}", param);
		    logger.info("파일:"+files[0].getSize());
			service.write(files,param);
			mav.setViewName("redirect:/approval/formList.go");
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		
		return mav;
	}
	

	@GetMapping(value="/approval/employeeList")
	@ResponseBody
	public HashMap<String,Object> employeeSearch() {
		HashMap<String,Object> result = new HashMap<String,Object>();
		ArrayList<HashMap<String, Object>> list = service.employeeList();
		result.put("list", list);
		result.put("size", list.size());
		return result;
	}
	
	
}
