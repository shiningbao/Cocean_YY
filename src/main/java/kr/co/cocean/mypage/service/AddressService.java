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
import kr.co.cocean.mypage.dto.OutAddressDTO;

@Service
public class AddressService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired AddressDAO dao;

	public ArrayList<OutAddressDTO> list() {
		
		return dao.list();
	}

	public int delete(ArrayList<String> delList) {
		int cnt = 0;		
		for (String addressNumber : delList) {
			// 글에 해당되는 사진이 있는지 확인
			cnt += dao.delete(addressNumber); // 글 지우기
			// 사진이 있으면 삭제
		}		
		return cnt;
	}
	//이름 검색

	public ModelAndView namesearch(List<String> name) {
		logger.info("서비스 시작");
		ModelAndView mav = new ModelAndView();
		ArrayList<OutAddressDTO> list = dao.namesearch(name);
		logger.info("검색중");
		mav.addObject("list", list);
		logger.info("list :" +list);
		mav.setViewName("mypage/outsideaddressBook");
		logger.info("뷰접속");
		return mav;
	}
	
	
	public String outsidejoin(HashMap<String, Object> params) {
		logger.info("서비스 도착");
		int row = dao.insert(params);		
		return row > 0 ? "외부주소록이 저장 되었습니다":"저장에 실패 했습니다.";
	}
	
	public OutAddressDTO detail(String addressNumber) {
		return dao.detail(addressNumber);
	}

	public ModelAndView update(Map<String, String> param) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/detail?employeeID="+param.get("employeeID"));
		dao.update(param);
		return mav;
	}

	public ArrayList<InaddressDTO> inaddress() {
		logger.info("내부 서비스 도착");
		return dao.inaddress();
	}

	//내부 검색
	public ModelAndView insearch(List<String> inname) {
		ModelAndView mav = new ModelAndView();
		ArrayList<InaddressDTO> list = dao.insearch(inname);
		mav.addObject("list", list);
		mav.setViewName("list");
		return mav;
	}

	

	//수정 페이지
	public OutAddressDTO outupdate(String addressNumber) {
		return dao.outupdate(addressNumber);
	}

	public void outsideupdate(OutAddressDTO dto) {
		dao.outsideupdate(dto);
		
	}

	
	
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
