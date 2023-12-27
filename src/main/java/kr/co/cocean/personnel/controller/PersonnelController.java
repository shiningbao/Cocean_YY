package kr.co.cocean.personnel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.service.PersonnelService;
import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class PersonnelController {
	
	@Autowired PersonnelService service;
	@Autowired ScheduleService scService;
	@Autowired PasswordEncoder encoder;
	Logger logger = LoggerFactory.getLogger(getClass());
	PersonnelDTO dto = new PersonnelDTO();
	
	@RequestMapping(value="/personnel/join.go")
	public String personnel() {
		
		return "personnel/personnel";
	}
	
	@GetMapping(value="/personnel/getBranchID.do")
	@ResponseBody
	public List<String> getBranchID(String branchID) {
		logger.info("인사등록 팀리스트 호출");
		logger.info("지점번호 =="+branchID);
		List<String> teams = service.getBranchID(branchID);

		return teams;
	}
	
	@GetMapping(value="/personnel/getHqID.do")
	@ResponseBody
	public List<String> getHqID(String hqID) {
		logger.info("인사등록 담당리스트 호출");
		logger.info("val =="+hqID);
		List<String> res = service.getHqID(hqID);

		return res;
	}
	@PostMapping(value="/personnel/join.do")
	public ModelAndView join(@RequestParam HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("personnel/personnel");
		logger.info("params =="+params);
		String page= "";
		String pw = "cocean1111";
		
		String password = encoder.encode(pw);
		params.put("password", password);
		int row= service.join(params);
		if(row>0) {
			String perNum = (String) params.get("employeeID");
			page="personnel/personnel";
			mav.addObject("msg", "사원 등록 성공");
		}else {
			page="personnel/personnel";
			mav.addObject("msg", "사원 등록 실패");
		}
		return mav;
	}
	
	@RequestMapping(value="/personnel/getBranch.do")
	@ResponseBody
	public List<String> getBranch(){
		
		List<String> getbranch = service.getBranch();
		
		return getbranch;
	}
	
	@RequestMapping(value="/personnel/getDepartmentText.do")
	@ResponseBody
	public List<String> getDepartmentText(String departmentText){
		
		List<String> getDepartmentText = service.getDepartmentText(departmentText);
		
		return getDepartmentText;
	}
	
	
	
}
