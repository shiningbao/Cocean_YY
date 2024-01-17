package kr.co.cocean.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.main.service.MainService;
import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Controller
public class MainController {
	
	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/side")
	public String side() {

		return "side";
	}

	@RequestMapping(value="/footer")
	public String footer() {

		return "footer";
	}

	@RequestMapping(value="/newSide")
	public String newSide() {

		return "newSide";
	}

	@RequestMapping(value="/home")
	public String home(Model model,HttpSession session) {
		ArrayList<BoardDTO> notice = service.getNoticeList();
		LoginDTO userInfo = new LoginDTO();
		String employeeID =(String) session.getAttribute("employeeId");
		logger.info("@@@@@@@@@@@@" +employeeID);
		//HashMap<String, Object> list = service.detail(employeeID);
		ArrayList<ApprovalDTO> wList = service.homeWaitingList(employeeID);
		
		model.addAttribute("wList", wList);	
		model.addAttribute("notice", notice);
		return "home";
	}
	

}
