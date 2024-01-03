package kr.co.cocean.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.mypage.dao.AddressDAO;
import kr.co.cocean.mypage.dto.InaddressDTO;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.OutAddressDTO;

@Service
public class AddressService {

   Logger logger = LoggerFactory.getLogger(getClass());

   @Autowired AddressDAO dao;

   //외부리스트
   public ArrayList<OutAddressDTO> list() {
      
      return dao.list();
   }

   public int delete(ArrayList<String> delList) {
      int cnt = 0;      
      for (String addressNumber : delList) {
         cnt += dao.delete(addressNumber); 
      }      
      return cnt;
   }

   public String outsidejoin(HashMap<String, Object> params) {
      logger.info("서비스 도착");
      int row = dao.insert(params);      
      return row > 0 ? "외부주소록이 저장 되었습니다":"저장에 실패 했습니다.";
   }
   
   public OutAddressDTO detail(String addressNumber) {
      return dao.detail(addressNumber);
   }
/*
   public ModelAndView update(Map<String, String> param) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("redirect:/detail?employeeID="+param.get("employeeID"));
      dao.update(param);
      return mav;
   }
*/
   //본래 내부주소록리스트
   /*
   public ArrayList<InaddressDTO> inaddress() {
      logger.info("내부 서비스 도착");
      return dao.inaddress();
   }*/



   //수정 페이지
   public OutAddressDTO outupdate(String addressNumber) {
      return dao.outupdate(addressNumber);
   }


   //수정버튼
   public void outaddressupdate(OutAddressDTO dto) {
	   logger.info("서비스 도착");
	   dao.outaddressupdate(dto);      
   }

   //외부검색 
public ArrayList<OutAddressDTO> reserch(String name) {
	
	ArrayList<OutAddressDTO> relist = dao.reserchuser(name);
	
	return relist;
}

//내부 리스트
public ArrayList<InaddressDTO> inlistCall() {
	
	return dao.inlistCall();
}

//내부 검색
public ArrayList<OutAddressDTO> inaddresssearch(String inname) {
	
	ArrayList<OutAddressDTO> relist1 = dao.inaddresssearch(inname);
	
	return relist1;
}























   //외부검색
   
	/*
	 * public HashMap<String, Object> namesearch(String name) {
	 * logger.info("외부 검색 서비스 접속"); return dao.namesearch(name); }
	 */
   
   
   /*
   public HashMap<String, Object> interioraddressBook(String page, int userId) {
      int pa = Integer.parseInt(page);
      int set = (pa*10)-10;
      ArrayList<AddressDTO> list =dao.interioraddresslist(userId,page);
      HashMap<String, Object> map = new HashMap<String, Object>();
      int pages = dao.interioraddresspage(userId);
      map.put("pages", pages);
      map.put("addressList", list);
      return map;
      
   }*/

   //통과
   /*



   public ArrayList<OutAddressDTO> interioraddressBooklist() {
      
      return dao.interioraddressBooklist();
   }

   public void del(int addressNumber) {
      dao.del(addressNumber);
      
   }

   public ArrayList<OutAddressDTO> list() {
      
      return dao.list();
   }

   public ArrayList<InaddressDTO> inlist() {
      
      return dao.inlist();
   }

   

   */
   //수정
   /*
   public int update(HashMap<String, Object> params) {
      
      return dao.update(params);
   }*/

   


   


   
   

   
   
   
}