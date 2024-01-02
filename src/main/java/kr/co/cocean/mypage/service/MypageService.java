package kr.co.cocean.mypage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.mypage.dao.MypageDAO;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.MypageDTO;

@Service
public class MypageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MypageDAO dao;
	@Autowired PasswordEncoder encoder;
	
/* 리스트
	public HashMap<String, Object> myInfo(int userId) {
		logger.info("서비스 받았다");
		HashMap<String, Object> map = new HashMap<String, Object>();		
		/*
		Map<String, Object>  = new HashMap<String, Object>();
		
		
		ArrayList<MypageDTO> myInfo = dao.myInfo(userId);
		
		/*
		review = dao.(userId);
		*/
		/*
		map.put("review", review);
		map.put("myInfo", myInfo);
		logger.info("dao로 보낸다");
		*/
		
		
		
		//맵선언
		/*
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		//연차
		Map<String, Object> review = new HashMap<String, Object>();
		ArrayList<MypageDto> myInfo = dao.myInfo(userId);
		review = dao.review(userId);
		map1.put("review", review);
		map1.put("myInfo", myInfo);
		
		return map1;
	}*/
	
	
	
	

	//비밀번호 조회
	/*
	public String pwCheck(int employeeID) {	
		logger.info("다오로 가는중");
		return dao.pwCheck(employeeID);
	}
	
	//비밀번호 수정
	
	public Object pwUpdate(String memberId, String hashedPw) {

		return dao.pwUpdate(memberId,hashedPw);
	}*/
	
	//비밀번호 수정
	
	public int changePw(HashMap<String, Object> params, int employeeID) {
		logger.info("비밀번호 변경 서비스 도착");
		int success = 0;
		logger.info("success :"+success);
		logger.info("params :"+params);

		
		String encpw = dao.selectEncpw(employeeID);
		
	
		String currentPw = (String) params.get("currentPw");
		logger.info("currentpw :"+currentPw);
		String newPw = (String) params.get("newPw");
		logger.info("encpw :" +encpw,"currentPw :"+currentPw,"newPw :"+newPw );
		
		if(encoder.matches(currentPw,encpw)) {
			
			String newPass = encoder.encode(newPw);
			dao.changePw(newPass,employeeID);
			success = 1;
			logger.info("성공");
		}else {
			logger.info("실패");
			success = 0;
		}
		
		return success;
	}



	//마이페이지 리스트
	
	public ArrayList<MypageDTO> mypagelist() {
		

		return dao.mypagelist();
	}

	
	//마이페이지 리스트 ajax
	/*
	public String animalDetailAjax(int animalID, String con, Model model) {
		String page = "aquarium/animalDetail_"+con;
		if(con.equals("base")) {
			// 기본 정보
			model.addAttribute("base", dao.animalDetail(animalID));
			// 이미지
			model.addAttribute("image", dao.animalImage(animalID));
			// 담당자
			model.addAttribute("incharge", dao.animalInCharge(animalID));
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String month = sdf.format(System.currentTimeMillis());
			model.addAttribute(con, dao.animalLogPlan(animalID, con,month));
			model.addAttribute("month", month);
		}
		
		return page;
	}*/

	
	/*
	public int changePw(HashMap<String, Object> params) {
	    String encpw = dao.selectEncpw(params.get("getEmployeeID"));

	    if (encpw != null && BCrypt.checkpw(params.get("currentPw").toString(), encpw)) {
	        // Use the correct method for encoding the new password
	        params.put("newPw", BCrypt.encode(params.get("newPw").toString()));
	        return dao.changepw(params);
	    }

	    return 0;
	}*/
	
	


	
	//수정
	/*
	public boolean checkPassword(int member_id, String checkPassword) {
		Member member = memberRepository.findById(member_id).orElseThrow(() ->
        new IllegalArgumentException("해당 회원이 존재하지 않습니다."));
		String realPassword = member.getPassword();
		boolean matches = encoder.matches(checkPassword, realPassword);
		return matches;
	}*/
	
	


	
}
