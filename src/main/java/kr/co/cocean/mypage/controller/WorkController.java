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
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
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
	

	

		@GetMapping(value="mypage/worklist")
		@ResponseBody
		public Map<String, Object> worklist(@RequestParam("pfirstsearchdate") String pfirstSearchDate,
			    @RequestParam("plastsearchdate") String plastSearchDate,HttpSession session){
			logger.info("work 컨트롤러 접속");
			LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
	        logger.info("userInfo: "+userInfo);
	        int userId = userInfo.getEmployeeID();
			return service.worklist(pfirstSearchDate,plastSearchDate,userId);
		}
	
	/*
		@GetMapping(value="mypage/save-timestamp")
		public String gowork(WorkDTO dto,HttpSession session ) {
			LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
	        logger.info("userInfo: "+userInfo);
	        int userId = userInfo.getEmployeeID();
			Timestamp gotime = dto.getGowork();
			return service.gowork(userId,gotime);
		}
	*/
		
	    @PostMapping("mypage/save-timestamp")
	    public ModelAndView saveTimestamp(WorkDTO dto,HttpSession session) {
	    	logger.info("출근 컨트롤 접속");
	    	LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
	        logger.info("userInfo: "+userInfo);
	        int userId = userInfo.getEmployeeID();
	    	Timestamp tp= dto.getGowork();
	    	Date de= dto.getWorkDate();
	        service.saveTimestamp(tp,userId,de);
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("mypage/work");
	        mav.addObject("message", "출근 기록이 저장되었습니다.");
	        return mav;
	    }
	}

	

