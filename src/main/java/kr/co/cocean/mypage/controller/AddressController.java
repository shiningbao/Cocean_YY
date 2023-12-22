package kr.co.cocean.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

import kr.co.cocean.mypage.dto.AddressDTO;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.service.AddressService;

@Controller
public class AddressController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AddressService service;

	
	
	//내부 주소록
	/*
	@PostMapping(value="/mypage/interioraddressBook.ajax")
	@ResponseBody
	public HashMap<String, Object> interioraddressBook(
	@RequestParam String page,HttpSession session		){
	logger.info("page : "+page);
	LoginDTO userinfo = (LoginDTO) session.getAttribute("userinfo");
		int userId = userinfo.getEmployeeID();
		return service.interioraddressBook(page,userId);	
	}*/
	
	//외부주소록 
	@RequestMapping(value="mypage/address")
	public String list(Model model,HttpSession session) {		
		ArrayList<AddressDTO> list = service.list();
		model.addAttribute("list",list);
		return "mypage/outsideaddressBook";
	}
	
	//상세
	@RequestMapping(value="/detail")
	public String detail(int addressNumber, Model model) {
		AddressDTO dto = service.detail(addressNumber);
		model.addAttribute("address", dto);
		return "detail";
	}
	
	
	/*
	@GetMapping(value="/address")// 변경하기 
	public String outsidejoin() {
		logger.info("개인 주소록 저장");
		return "/mypage/outsidejoin";
	}*/
	
	
	//외부주소록 저장
	@PostMapping(value="/outsidejoins")
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
		mav.addObject("redirect:/side"); // 페이지 변경
		return mav ;
	}
	
	
	
	//회원정보 수정 페이지
	@PostMapping(value="/address")
	public String updateForm(Model model, @RequestParam HashMap<String, Object> params) {
		model.addAttribute("update", service.detail(params));
		return "mypage/outsideupdate";
	}
	

	 
	//외부주소록 수정
	/*
	@PostMapping(value="/outsideupdate")
	public String outsideupdate(HttpSession session) {

	return null;
}*/
	
	
	/*
	@GetMapping(value = "/del")
	public String del(String addressNumber) {
		service.del(addressNumber);
		return "redirect:mypage/outsideaddressBook";
	}*/
	
	//선택,전체 삭제
	/*
	@GetMapping(value="/delelt")
	public String delet(HttpServletRequest request) {
		
		String[] ajaxmsg = request.getParameterValues("valueArr");
		int size = ajaxmsg.length;
		for(int i=0; i<size; i++) {
			service.delete(ajaxmsg[i]);
		}
		return "redirect:list";
	}*/
	
	//선택삭제
	@GetMapping(value="/outsideaddressBook/{addressNumber}")
	public String mailDelete(String addressNumber){
	logger.info("addressNumber :"+addressNumber);
			service.delete(addressNumber);
		
		return "redirect:mypage/outsideaddressBook";
	}
	
	
	

	
}
