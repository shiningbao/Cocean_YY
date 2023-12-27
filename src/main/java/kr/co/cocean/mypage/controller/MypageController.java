package kr.co.cocean.mypage.controller;

import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.service.MypageService;

@Controller
public class MypageController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageService service;
	
	
	

	
	@GetMapping(value="mypage/mypage")
	public String mypage() {
		logger.info("체크");
		return "/mypage/mypage";
	}
	
	@PostMapping(value="/mypage/myInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> myInfo(Model model, HttpSession session){
		logger.info("다시체크");
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int userId = userInfo.getEmployeeID();
		HashMap<String, Object> map = service.myInfo(userId);
		return map;
	}
	
	

}
