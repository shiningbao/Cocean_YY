package kr.co.cocean.mypage.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dto.InaddressDTO;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.OutAddressDTO;
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
   /*
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
   }*/


   @GetMapping(value="mypage/listCall")
   @ResponseBody
   public HashMap<String, Object> listCall(HttpSession session) {
      logger.info("list 시작");
      HashMap<String, Object>result = new HashMap<>();
      LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
      int userId= userInfo.getEmployeeID();
      if(session.getAttribute("userInfo") == null) {
         result.put("login", false);
      }else {
         result.put("login", true);
         ArrayList<OutAddressDTO> list = service.list(userId);
         result.put("list", list);
      }
      logger.info("서비스 넘어가기전");
      return result;
   }





   //외부검색
   @GetMapping(value = "mypage/addresssearch")
   @ResponseBody
   public HashMap<String, Object> search(@RequestParam(required = false) String query,
                                         Model model) {
       logger.info("검색 list");

       HashMap<String, Object> result = new HashMap<>();
       
       
       ArrayList<OutAddressDTO> list = service.search(query);
       
       result.put("list", list);
       result.put("size", list.size());

       logger.info("result: " + result);

       return result;
   }



   //내부 리스트(다시)
   @GetMapping(value="mypage/addresslistCall")
   @ResponseBody
   public HashMap<String, Object> inlistCall(HttpSession session) {

	   logger.info("in list 시작");
	      HashMap<String, Object>result1 = new HashMap<>();

	      if(session.getAttribute("userInfo") == null) {
	         result1.put("login", false);
	      }else {
	         result1.put("login", true);
	         ArrayList<InaddressDTO> list1 = service.inlistCall();
	         result1.put("list1", list1);
	      }
	      logger.info("in 서비스 넘어가기전");
	      return result1;
   }



   //내부검색
   @GetMapping(value = "mypage/inaddresssearch")
   @ResponseBody
   public HashMap<String, Object> inaddresssearch(@RequestParam String mul, Model model) {
       logger.info("검색 list");

       HashMap<String, Object> result1 = new HashMap<>();

       ArrayList<OutAddressDTO> list1 = service.inaddresssearch(mul);

       result1.put("list1", list1);
       result1.put("size", list1.size());

       logger.info("result1: " + result1);

       return result1;
   }




   //외부선택삭제,전체삭제
   @GetMapping(value="mypage/delete")
   @ResponseBody
   public HashMap<String, Object> delete(
         HttpSession session,
         @RequestParam(value="delList[]") ArrayList<String> delList){

      logger.info("delList : "+delList);
      HashMap<String, Object> result = new HashMap<>();

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
         mav.setViewName("/mypage/outsideaddressBook"); // 요청명 변경
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

         //수정
            @PostMapping(value="mypage/outaddressupdate")
            public String outaddressupdate(OutAddressDTO dto, Model model) {
                logger.info("update 실행");
                logger.info(dto.getName() + "/" + dto.getAddressNumber());

                // 서비스에서 데이터 업데이트
                service.outaddressupdate(dto);

                logger.info("service 들어가기 전");

                // 메시지 추가
                model.addAttribute("msg", "주소록이 성공적으로 수정되었습니다.");

                return "/mypage/outsideaddressBook";
            }


          //디테일,수정,저장 리스트로 돌아가기
          @RequestMapping(value="mypage/list")
          public String list() {
             return "mypage/outsideaddressBook";
          }











}



