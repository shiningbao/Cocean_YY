package kr.co.cocean.aquarium.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;
import kr.co.cocean.aquarium.service.AnimalService;

@Controller
public class AnimalController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnimalService service;
	
	@GetMapping(value = "/animal/list.go")
	public ModelAndView animalList() {
		
		ModelAndView mav = new ModelAndView("/aquarium/animalList");
		
		// 코션친구들 리스트
		ArrayList<AnimalDTO> list = service.animalList();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping(value = "/animal/write.go")
	public String writeGo() {
		return "/aquarium/animalWrite";
	}
	
	@PostMapping(value = "/animal/write.do")
	public String writeDo(@RequestParam HashMap<String,String> param) {
		logger.info("param : {}",param);
		return "/aquarium/animalWrite";
	}
	
	@GetMapping(value = "/animal/classficationPopup")
	public String classficationPopup() {
		return "/aquarium/classfication";
	}
	
	@GetMapping(value = "/animal/classficationSearch")
	@ResponseBody
	public HashMap<String, Object> search(@RequestParam String keyword) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ArrayList<ClassficationDTO> list = service.classficationSearch(keyword);
		result.put("list", list);
		return result;
	}
	
}
