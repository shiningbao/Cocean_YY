package kr.co.cocean.store.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.cocean.store.service.StoreService;
	
@Controller
public class StoreController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreService service;
	
	@GetMapping(value="storeList.go")
	public String storeListGo(){
		return "store/store";
	}
	
	@GetMapping(value="storeList.do")
	public Map<String, Object> storeList() {
		logger.info("스토어 리스트");
		return service.storeList();
	}
	
	@GetMapping(value="branch.map.do")
	public String branchMap() {
		return "";
	}
}
