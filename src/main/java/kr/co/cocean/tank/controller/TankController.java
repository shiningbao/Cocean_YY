package kr.co.cocean.tank.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.tank.dto.Pager;
import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.dto.TankRecordDTO;
import kr.co.cocean.tank.service.TankService;

@Controller
public class TankController {
	
	@Autowired
	TankService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@GetMapping(value="/tank/list.go")
	public ModelAndView tankList(ModelAndView mav, TankDTO tankDTO, Pager pager) {
		mav.setViewName("tank/tankList");
		List<TankDTO> list = service.tankList(pager); 
		mav.addObject("list",list);
		mav.addObject("pager",pager);
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
	public ModelAndView detail(@RequestParam int tankID) {
		ModelAndView mav = new ModelAndView("tank/tankDetail");
		HashMap<String, Object> map = service.tankDetail(tankID);
		List<Map<String, Object>> tankAnimal = service.tankAnimal(tankID);
		HashMap<String, Object> recentRecord = service.recentRecord(tankID);
		mav.addObject("recent",recentRecord);
		mav.addObject("tankAnimal",tankAnimal);			
		mav.addObject("map",map);
		return mav;
	}
	
	@GetMapping("tank/getChart")
	@ResponseBody
	public List<TankRecordDTO> getChart(@RequestParam String tankID, String recordDate, Model model){
		List<TankRecordDTO> list = service.getChart(tankID,recordDate);
		model.addAttribute("list",list);
		return list;
	}
	
	
	@GetMapping("tank/tankSet.go")
	public ModelAndView tankSetForm(@RequestParam int tankID) {
		ModelAndView mav = new ModelAndView("tank/tankSetForm");
		HashMap<String, Object> map = service.tankDetail(tankID);
		List<Map<String, Object>> branchList = service.getBranch();
		mav.addObject("map",map);
		mav.addObject("branchList",branchList);
		logger.info("map"+map);
		return mav;
	}
	
	@PostMapping("tank/tankSet.do")
	public String tankSetting(@RequestParam Map<String, Object> params) throws UnsupportedEncodingException {
		// String emName = URLEncoder.encode(params.get("emName").toString(),"UTF-8"); 
		String tankID = params.get("tankID").toString();
		logger.info("params "+params);
		service.tankSet(params);
		return "redirect:/tank/detail.go?tankID="+tankID;
	}
	
	@GetMapping("tank/houseLog.go")
	public ModelAndView houseLog(@RequestParam int tankID, HttpSession session) {
		ModelAndView mav = new ModelAndView("tank/houseLog");
		mav.addObject("tankID",tankID);
		return mav;
	}
	
	@RequestMapping("tank/getRecord.ajax")
	@ResponseBody
	public List<Map<String, Object>> gerRecord(@RequestParam String tankID, String curDate, Model model) {
		List<Map<String, Object>> recordList = service.getRecord(tankID,curDate);
		logger.info("recordList: "+recordList.toString());
		model.addAttribute("recordList",recordList);
		model.addAttribute("tankID", tankID);
		return recordList;
		
	}
	
	

	
	
	
	

	
}











