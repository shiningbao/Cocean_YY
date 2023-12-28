package kr.co.cocean.tank.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.service.TankService;

@Controller
public class TankController {
	
	@Autowired
	TankService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@GetMapping(value="/tank/list.go")
	public ModelAndView tankList(ModelAndView mav, TankDTO tankDTO) {
		mav.setViewName("tank/tankList");
		List<TankDTO> list = service.tankList(tankDTO); 
		mav.addObject("list",list);
		return mav;
		
	}
	
	@GetMapping("/tank/write.go")
	public ModelAndView tankWriteForm(){
		ModelAndView mav = new ModelAndView("tank/writeForm");
		List<Map<String, Object>> branchList = service.getBranch();
		mav.addObject("branchList",branchList);
		logger.info("branch"+branchList.size());
		return mav;
	}
	
	@PostMapping("tank/tankWrite.do")
	public String tankWrite(@RequestParam Map<String, Object> params, HttpSession session) {
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		params.put("employeeID", userInfo.getEmployeeID());
		service.tankWrite(params);
		return "redirect:/tank/list.go";
	}
	
	@GetMapping("tank/detail.go")
	public ModelAndView detail(@RequestParam int tankID, String emName) {
		ModelAndView mav = new ModelAndView("tank/tankDetail");
		HashMap<String, Object> map = service.tankDetail(tankID);
		mav.addObject("map",map);
		mav.addObject("emName",emName);
		return mav;
	}
	
	
}
