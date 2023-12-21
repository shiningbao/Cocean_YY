package kr.co.cocean.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.service.AddressService;

@Controller
public class AddressController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AddressService service;
	
	/*
	@GetMapping(value="/mypage")// 변경하기 
	public String mypage() {
		logger.info("마이 페이지");
		return "/mypage/interioraddressBook";
	}*/
	
	//내부주소록
	@PostMapping(value="/mypage/interioraddressBook.ajax")
	@ResponseBody
	public HashMap<String, Object> interioraddressBook(
	@RequestParam String page,HttpSession session		){
	logger.info("page : "+page);
	LoginDTO userinfo = (LoginDTO) session.getAttribute("userinfo");
		int userId = userinfo.getEmployeeID();
		return service.interioraddressBook(page,userId);	
	}
	
	//외부주소록
	/*
	@PostMapping(value="/mypage/interioraddressBook.ajax") //이름 바꿔서 접속해보기
	@ResponseBody
	public HashMap<String, Object>outsideaddressBook(
	@RequestParam String page,HttpSession session		){
	logger.info("page : "+page);
	LoginDTO userinfo = (LoginDTO) session.getAttribute("userinfo");
	int userId = userinfo.getEmployeeID();
	return service.address(page,userId);	
	}*/
	
	
	
	@GetMapping(value="/address")// 변경하기 
	public String outsidejoin() {
		logger.info("개인 주소록 저장");
		return "/mypage/outsidejoin";
	}
	//외부주소록 저장
	@PostMapping(value="/outsidejoins")
	public ModelAndView outsidejoins(@RequestParam HashMap<String, Object> params,HttpSession session) {
		logger.info("params : "+params);
		LoginDTO userinfo = (LoginDTO) session.getAttribute("userinfo");
		int userId = (int) session.getAttribute("employeeID");
		logger.info("userId :"+ userId);
		params.put("userId", userId);
		logger.info("params : "+params);
		String msg = service.outsidejoin(params);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mypage/outsideaddressBook");
		return mav ;
	}
	
	
	//외부주소록 수정
	/*
	@PostMapping(value="/outsideupdate")
	public String outsideupdate(HttpSession session,) {
	
	return null;
}*/
	
	
	
}
