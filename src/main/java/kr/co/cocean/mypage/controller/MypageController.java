package kr.co.cocean.mypage.controller;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@GetMapping(value="mypage/mypage")
	public String mypage() {
		logger.info("마이 페이지 이동 요청");
		return "mypage/mypage";
	}

	//마이페이지 리스트
	/*
	@GetMapping(value="/mypage/myInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> myInfo(Model model, HttpSession session){
		logger.info("리스트 가져오기 시작");
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		int userId = userInfo.getEmployeeID();
		HashMap<String, Object> map = service.myInfo(userId);
		logger.info("서비스 이동");
		return map;
	}*/
	

	@GetMapping(value="mypage/listcall")
	@ResponseBody
	public HashMap<String, Object> mypagelist(HttpSession session){
		logger.info("mypage 컨트롤 접속");
		HashMap<String, Object>result = new HashMap<String, Object>();
		ArrayList<MypageDTO> list = service.mypagelist();
		
		result.put("list", list);
		
		return result;
	}
	
	
	/*
	@PostMapping(value = "/animal/detail.ajax")
	public String animalDetailAjax(@RequestParam String animalID, @RequestParam String con, Model model) {
		logger.info("animalID : {}",animalID);
		int intAnimalID = Integer.parseInt(animalID);
		logger.info("con : {}",con);
		return service.animalDetailAjax(intAnimalID, con, model);
	}*/	


	
	
	//수정 페이지 이동(이건다시 테스트 하기)
	@GetMapping(value="/mypage/mypageupdate")
	public String mypageupdate() {
		logger.info("수정 페이지 이동");
		return "mypage/mypageupdate";
	}
	
	//암호화 비밀번호 조회
	/*
	@PostMapping(value="/mypage/pwCheck")
	@ResponseBody
	public int pwCheck(LoginDTO dto, HttpSession session)
	{
		
		logger.info("컨틀롤입장");
		dto = (LoginDTO) session.getAttribute("userInfo");
		logger.info("dto :"+dto);
		String memberPw = service.pwCheck(dto.getEmployeeID());
		if( dto == null || !BCrypt.checkpw(dto.getPassword(), memberPw)) {
			return 0;
		}
		return 1;
	}*/
	
	/*
	@PostMapping(value="mypage/pwCheck")
	@ResponseBody
	
	public boolean pwCheck(String memberPw,HttpSession session){
		logger.info("암호화 비밀번호 조회");
	    LoginDTO logindto = (LoginDTO) session.getAttribute("userInfo");
		boolean chk = encoder.matches(memberPw, logindto.getPassword());
		logger.info("비밀번호 조회 서비스 이동");
		return chk;		
	}*/
	
	
	
	
	//비밀번호 수정	
	/*
	@PostMapping(value="/mypage/pwUpdate" )
	public String pwUpdate(String memberId,String memberPw1,Model model,HttpSession session){
		logger.info("비밀번호 수정 컨트롤 입장");
		String hashedPw = BCrypt.hashpw(memberPw1, BCrypt.gensalt());
		service.pwUpdate(memberId, hashedPw);
		session.invalidate(); /*https://m.blog.naver.com/truestar007/90037206672
		model.addAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
		logger.info("수정 서비스로 넘어갑니다");
		return "redirect:/mypage/login";
	}*/
	
	
	
	
	
	//수정(암호화)
	
	@PostMapping(value="/mypage/changePw")
	public String changePw(HttpSession session,@RequestParam HashMap<String , Object>params,Model model) {
		String page= "mypage/mypageupdate";

		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		params.put("EmployeeID", dto.getEmployeeID());
		logger.info("parmas: "+params);
		//비밀번호 변경 서비스 호출
		
		int result =service.changePw(params);
		
		logger.info("result: "+result );
		

		if(result >0) {
			model.addAttribute("msg","수정에 성공 했습니다");
			page = "redirect:/login";
		}else {
			model.addAttribute("msg", "현재 비밀번호가 일치 하지 않습니다.");
		}
		
		return page;
	}

	
	
	
	
	
	
		
	}

	

	
	

