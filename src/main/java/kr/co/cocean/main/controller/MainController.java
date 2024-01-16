package kr.co.cocean.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired MainService service;
	

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
	public String home(Model model) {
		ArrayList<BoardDTO> notice = service.getNoticeList();
		model.addAttribute("notice", notice);
		return "home";
	}


}
