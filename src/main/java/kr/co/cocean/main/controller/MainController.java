package kr.co.cocean.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/side")
	public String side() {
		
		return "side";
	}
	
	@RequestMapping(value="/newSide")
	public String newside() {
		
		return "newSide";
	}
	
	@RequestMapping(value="/home")
	public String home() {
		
		return "home";
	}
	
	@GetMapping(value = "/testmodal")
	public String testmodal() {
		return "modal";
	}
	
}
