package kr.co.cocean.mypage.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.MypageDTO;
import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.service.MypageService;

@Controller
public class MypageController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageService service;

		
	/*
	@GetMapping(value="mypage/mypage")
	public ModelAndView mypagedetail(HttpSession session) {
		logger.info("마이 페이지 이동 요청");
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
        logger.info("userInfo: "+userInfo);
        int userId = userInfo.getEmployeeID();
		logger.info("userId: "+userId);
		ModelAndView mav = new ModelAndView("mypage/mypage");
		logger.info("list접속전" );
		List<HashMap<String, Object>> list = service.mypagedetail(userId);
		logger.info("list: "+list);
		mav.addObject("list", list);
		return mav;
	}*/
	

	
	@GetMapping(value="mypage/mypage")
	public ModelAndView mypagedetail(HttpSession session) {
		logger.info("마이 페이지 이동 요청");
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
        logger.info("userInfo: "+userInfo);
        int userId = userInfo.getEmployeeID();
		logger.info("userId: "+userId);
		ModelAndView mav = new ModelAndView("mypage/mypage");
		HashMap<String, Object> list = service.detail(userId);
		HashMap<String, Object> getEmployeeAnnual = service.getEmployeeAnnual(userId);
		mav.addObject("mypage", list);	
		mav.addObject("getEmployeeAnnual", getEmployeeAnnual);
		return mav;
	}
	

	
	//수정 페이지 이동
	@GetMapping(value="/mypage/mypageupdate")
	public String mypageupdate() {
		logger.info("수정 페이지 이동");
		return "mypage/mypageupdate";
	}
	

	
	//수정(암호화)
	
	@PostMapping(value="/mypage/changePw")
	public String changePw(HttpSession session,@RequestParam HashMap<String , Object>params,Model model) {
		String page= "mypage/mypageupdate";

		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		int employeeID = dto.getEmployeeID();
		logger.info("parmas: "+params);
		logger.info("employeeID :"+employeeID);
		//비밀번호 변경 서비스 호출
		
		int result =service.changePw(params,employeeID);
		
		logger.info("result: "+result );
		

		if(result >0) {
			model.addAttribute("msg","수정에 성공 했습니다");
			page = "redirect:/home";
		}else {
			model.addAttribute("msg", "현재 비밀번호가 일치 하지 않습니다.");
		}
		
		return page;
	}

	
	
}
	
	

	
	

