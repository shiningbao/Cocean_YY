package kr.co.cocean.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.service.LoginService;

@Controller
public class LoginController {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired LoginService service;
	
	
	//접속
	@GetMapping(value="/")
	public String login() {
		return "mypage/login";
	}
	
	//로그인

	@PostMapping(value="/logingo")
	public ModelAndView logingo(HttpSession session , @RequestParam String password, String userNum){
		logger.info("test");
		String page = "mypage/login"; 
		logger.info("userNum : "+userNum+" / password :"+password);
		ModelAndView mav = new ModelAndView();

		LoginDTO dto = service.login(userNum);
		boolean success= service.getPw(userNum,password);
		if(success) {//로그인 성공
			session.setAttribute("userinfo",dto);
			page = "redirect:/home";

		}else {// 로그인 실패시
			mav.addObject("msg","비밀번호를 잊어버린 경우 인사과로 문의 해주세요");
		}
		mav.setViewName(page);
		return mav;
	}
	

	
	//로그아웃
	@GetMapping(value = "/mypage/logout")
	public ModelAndView logout(HttpSession session) {
	session.removeAttribute("userInfo");
	ModelAndView mav = new ModelAndView();
	mav.setViewName("mypage/login");
	mav.addObject("msg", "로그아웃되었습니다");
	return mav ;
	}

	
	
	

}
