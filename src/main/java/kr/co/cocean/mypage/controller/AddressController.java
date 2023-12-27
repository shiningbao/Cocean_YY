package kr.co.cocean.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
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
	//외부검색 
	
			@GetMapping(value="mypage/namesearch")
			@ResponseBody
			public ModelAndView namesearch(@RequestParam List<String> name) {
				logger.info("검색");
				logger.info("name : {}",name);
				return service.namesearch(name);
			}
	
	
		
	
	//내부 리스트
	/*
	@RequestMapping(value="/mypage/address")
	public String inaddress( Model model,HttpSession session) {
			String page = "mypage/login";
		logger.info("내부 리스트");
		if(session.getAttribute("userInfo") != null) {
			ArrayList<InaddressDTO> list = service.inaddress();
			model.addAttribute("list", list);
			page = "mypage/outsideaddressBook";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		}
		
		return page;
	}*/
	/*위에꺼하고 둘중에 하나 골라서 테스트 해서 내부 리스트 가져오는거 정하기
	@GetMapping(value="mypage/address")
	public String list(Model model,HttpSession session) {		
		ArrayList<InaddressDTO> list = service.inaddress();
		model.addAttribute("list",list);
		return "mypage/outsideaddressBook";
	}*/
	
			
	/*
	@GetMapping(value = "/list.do")
	public String list(Model model) {
		ArrayList<BoardDTO> list = service.list();
		model.addAttribute("list", list);
		logger.info("test list");
		return "list";
	}*/
	
	//내부 검색
	@GetMapping(value="mypage/insearch")
	public ModelAndView insearch(@RequestParam List<String> inname) {
		logger.info("inname : {}",inname);
		return service.insearch(inname);
	}

	//선택삭제,전체삭제
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
			String msg = service.outsidejoin(params);
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("mypage/outsideaddressBook"); // 요청명 변경
			return mav ;
		}
		
		
		//외부 상세보기 페이지
		@GetMapping(value = "mypage/detail")
		public ModelAndView detail(@RequestParam String addressNumber) {	
			logger.info("addressNumber :"+addressNumber);
			OutAddressDTO outaddress = service.detail(addressNumber);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/mypage/outdetail");
			mav.addObject("outaddress",outaddress );

			return mav;
		}
		
	
		//주소록 수정페이지 이동
				@GetMapping(value="mypage/outsideupdate")
				public ModelAndView outupdate(@RequestParam String addressNumber) {
					logger.info("addressNumber :"+addressNumber);
					OutAddressDTO outaddress = service.outupdate(addressNumber);
					ModelAndView mav = new ModelAndView();
					mav.setViewName("mypage/outsideupdate");
					mav.addObject("outaddress",outaddress );

					return mav;
				}
				
		//수정중	
				/*
		@GetMapping(value="mypage/outaddressupdate")	
		public ModelAndView outaddressupdate(@RequestParam String )
		*/		
				
				
				
				
		//수정
				/*
				@RequestMapping(value="mypage/addressupdate", method= {RequestMethod.GET, RequestMethod.POST})
				public ModelAndView update(@RequestParam Map<String,String> param) {		
					logger.info("params : {}",param);		
					return service.update(param);		
				}*/
				
				//수정하기 기능
				/*
				@GetMapping(value = "mypage/outsideupdate")
				public String outsideupdate(OutAddressDTO dto) {
					logger.info("update실행");
					logger.info(dto.getName()+"/"+dto.getPhoneNumber());
					service.outsideupdate(dto);
					return "mypage/outdetail";
				}*/
		
		
	
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
	

	
	@GetMapping(value = "/mypage/del")//(삭제는 됨) 문제는 체크박스로 삭제가 안됨
	public String del(int addressNumber) {
		service.del(addressNumber);
		return "mypage/outsideaddressBook";
	}*/
	

	
	


}
	

	

