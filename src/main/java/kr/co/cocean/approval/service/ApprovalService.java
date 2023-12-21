package kr.co.cocean.approval.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.mypage.dto.LoginDTO;

@Service
public class ApprovalService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public ArrayList<ApprovalDTO> list() {
		
		return dao.list();
	}

	public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr, List<String> keyword) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		
		if(dto!=null) {
			ArrayList<ApprovalDTO> list = dao.formSearch(keyword);
			mav.addObject("list",list);
			mav.setViewName("approval/formList");
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		return mav;
	}

	public ArrayList<ApprovalDTO> draftInfo(int employeeID) {
		return dao.draftInfo(employeeID);
	}

	public void write(HashMap<String, String> param) {
		dao.write(param);
		
		dao.writeWorkDraft(param);
		// dao.writeAttendanceDraftContent(param);
		
	}

}
