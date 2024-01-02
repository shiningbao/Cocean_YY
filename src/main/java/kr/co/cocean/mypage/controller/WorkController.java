package kr.co.cocean.mypage.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;
import kr.co.cocean.mypage.service.WorkService;

@Controller
public class WorkController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkService service;
	
	
	@RequestMapping(value="mypage/work")
	   public String workco() {
	      return "mypage/work";
	   }
	
	/*
	@GetMapping(value="mypage/work")
	public String work(Model model,HttpSession session) {	
		logger.info("출/퇴근 접속");
		ArrayList<OutAddressDTO> list = service.work();
		model.addAttribute("list",list);
		logger.info("출/퇴근 서비스");
		return "mypage/work";
	}*/
	

		@GetMapping(value="mypage/worklist")
		@ResponseBody
		public Map<String, Object> work(@RequestParam("pfirstsearchdate") String pfirstSearchDate,
			    @RequestParam("plastsearchdate") String plastSearchDate){
			logger.info("work 컨트롤러 접속");
			return service.work(pfirstSearchDate,plastSearchDate);
		}
	
	

	

	
}
