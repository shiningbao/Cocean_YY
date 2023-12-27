package kr.co.cocean.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;
import kr.co.cocean.mypage.service.WorkService;

@Controller
public class WorkController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkService service;
	
	@GetMapping(value="mypage/work")
	public String work(Model model,HttpSession session) {		
		ArrayList<OutAddressDTO> list = service.work();
		model.addAttribute("list",list);
		return "mypage/work";
	}
	
	
}
