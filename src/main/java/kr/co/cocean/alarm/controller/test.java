package kr.co.cocean.alarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {
	
	@GetMapping(value="/side")
	public String side() {
		
		return "side";
	}
	
	@GetMapping(value="/login")
	public String login() {
		
		return "login";
	}
	
	@GetMapping(value="/modal")
	public String modal() {
		
		return "modal";
	}

}
