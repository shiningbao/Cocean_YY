package kr.co.cocean.store.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.store.service.StoreService;
	
@Controller
public class StoreController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreService service;
	
	@GetMapping(value="/store/storeList.go")
	public String storeListGo(){
		return "store/store";
	}
	
	@GetMapping(value="/store/storeList.do")
	@ResponseBody
	public Map<String, Object> storeList(Model model) {
		logger.info("스토어 리스트");
		return service.loadLocation(model);
	}
	
	@GetMapping(value="/store/storeList.ajax")
	@ResponseBody
	public Map<String, Object> storeListAjax(Model model) {
		logger.info("스토어 아작스");
		return service.storeList(model);
	}
	
	@GetMapping(value="/store/searchProduct.do")
	@ResponseBody
	public Map<String, Object> searchProduct(@RequestParam String searchKeyword, @RequestParam String branchName){
		logger.info("상품 검색");
		logger.info("serachKeyword : "+searchKeyword);
		logger.info("branchName : "+branchName);
		return service.searchProduct(searchKeyword,branchName);
	}
	
}
