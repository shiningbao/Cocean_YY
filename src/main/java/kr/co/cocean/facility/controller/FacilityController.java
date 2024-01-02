package kr.co.cocean.facility.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FacilityController {
	
	
	@RequestMapping(value="/facility/facility.go")
	public String faclity() {
		
		return "facility/facility";
	}

	
}
