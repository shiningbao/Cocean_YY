package kr.co.cocean.store.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public Map<String, Object> storeList(Model model) {
		logger.info("스토어 리스트");
		return service.loadLocation(model);
	}
	
	@GetMapping(value="branch.map.do")
	public String branchMap() {
		return "";
	}
}
