package kr.co.cocean.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.InaddressDTO;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.service.AddressService;

@Controller
public class AddressController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AddressService service;

	@RequestMapping(value="mypage/address")
	public String boardList() {
		return "mypage/outsideaddressBook";
	}
	
	//외부리스트
	@GetMapping(value="mypage/listCall")
	@ResponseBody
	public HashMap<String, Object> listCall(HttpSession session) {
		logger.info("list 시작");
		HashMap<String, Object>result = new HashMap<String, Object>();
		
		if(session.getAttribute("userInfo") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			ArrayList<OutAddressDTO> list = service.list();
			result.put("list", list);
		}
		logger.info("서비스 넘어가기전");	
		return result;
	}
	
	//선택삭제
	@GetMapping(value="mypage/delete")
	@ResponseBody
	public HashMap<String, Object> delete(
			HttpSession session,
			@RequestParam(value="delList[]") ArrayList<String> delList){
		
		logger.info("delList : "+delList);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(session.getAttribute("userInfo")==null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			int cnt = service.delete(delList);
			result.put("del_cnt", cnt);
		}
			
		return result;
	}
	
	//검색 
	@GetMapping(value="mypage/namesearch")
	public ModelAndView namesearch(@RequestParam List<String> name) {
		logger.info("검색");
		logger.info("name : {}",name);
		return service.namesearch(name);
	}
	
	
	
	
	//주소록 저장페이지 이동
		@RequestMapping(value="mypage/outsidejoin")
		public String joinForm() {
			return "mypage/outsidejoin";
		}
		
		//외부주소록 저장
		@PostMapping(value="mypage/outsidejoins")
		public ModelAndView outsidejoins(@RequestParam HashMap<String, Object> params,HttpSession session) {
			logger.info("params : "+params);
			LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
			logger.info("userInfo: "+userInfo);
			int userId = userInfo.getEmployeeID();
			logger.info("id :"+userInfo.getEmployeeID());
			logger.info("userId :"+ userId);
			params.put("userId", userId);
			logger.info("params : "+params);
			String msg = service.outsidejoin(params);
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("mypage/outsideaddressBook"); // 요청명 변경
			return mav ;
		}
	
	
	
	
	//내부주소록
	
	
	//내부 주소록
	/*
	@GetMapping(value="mypage/address")
	public String list(Model model,HttpSession session) {		
		ArrayList<InaddressDTO> list = service.inlist();
		model.addAttribute("list",list);
		
		return "mypage/outsideaddressBook";
	}*/
	

	//먼저 보열줄거 내부주소록
	//그다음 외부주소록
	//외부주소록 (수정할거 css)(끝)
	/*
	@GetMapping(value="mypage/address")
	public String list(Model model,HttpSession session) {		
		ArrayList<OutAddressDTO> list = service.list();
		model.addAttribute("list",list);
		return "mypage/outsideaddressBook";
	}
	
	
	
	
	//주소록 수정페이지 이동
		@GetMapping(value="mypage/outsideupdate")
		public String outupdate() {
			return "mypage/outsideupdate";
		}
	
	//수정
		@PostMapping(value="mypage/addressupdate")
		public String update(Model mode, @RequestParam HashMap<String, Object> params) {
			logger.info("params : "+params);
			OutAddressDTO dto = new OutAddressDTO();
			params.put("addressNumber", dto);
			String page = "redirect:/outsideupdate?addressNumber="+params.get("addressNumber");		
			if(service.update(params)>0) {
				page = "redirect:/outsideaddressBook?addressNumber="+params.get("addressNumber");			
			}
			return page;
		}*/

	/*내용이 안뜸*/
	/*
	@GetMapping(value="/mypage/detail")
	public ModelAndView detail(@RequestParam String addressNumber) {
		logger.info("시작");
		OutAddressDTO dto = service.detail(addressNumber);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", dto);
		mav.setViewName("/mypage/outdetail");
		return mav;
	}

	
	@GetMapping(value = "/mypage/del")//(삭제는 됨) 문제는 체크박스로 삭제가 안됨
	public String del(int addressNumber) {
		service.del(addressNumber);
		return "mypage/outsideaddressBook";
	}*/
	

	
	


}
	

	

