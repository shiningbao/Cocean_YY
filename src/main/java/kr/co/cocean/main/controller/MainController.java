package kr.co.cocean.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
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
	public String home() {
		
		return "home";
	}
	

}
