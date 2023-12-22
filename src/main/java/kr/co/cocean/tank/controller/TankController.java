package kr.co.cocean.tank.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.service.TankService;

@Controller
public class TankController {
	
	@Autowired
	TankService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@GetMapping(value="/tank/list.go")
	public ModelAndView tankList() {
		ModelAndView mav = new ModelAndView("tank/tankList");
		ArrayList<TankDTO> list = service.tankList(); 
		mav.addObject("list",list);
		return mav;
		
	}
}
