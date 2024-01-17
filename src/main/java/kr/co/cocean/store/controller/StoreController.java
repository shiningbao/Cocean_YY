package kr.co.cocean.store.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.store.service.StoreService;

@Controller
public class StoreController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreService service;

	@GetMapping(value="/store/storeList.go")
	public String storeListGo(){
		return "store/store";
	}

	@GetMapping(value="/store/storeMap.do")
	@ResponseBody
	public Map<String, Object> storeList(Model model) {
		logger.info("스토어 리스트");
		return service.kakaoAPi(model);
	}

	@GetMapping(value="/store/storeList.do")
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

	@PostMapping(value="/store/branchRegister.do")
	@ResponseBody
	public String brachRegister(@RequestParam String branchName,@RequestParam String branchLocation, @RequestParam double branchLatitude, @RequestParam double branchLongitude) {
			logger.info("지점 등록");
			logger.info("branchName : "+branchName);
			logger.info("branchLocation : "+branchLocation);
			logger.info("branchLatitude : "+branchLatitude);
			logger.info("branchLongitude : "+branchLongitude);
			return service.brachRegister(branchName, branchLocation, branchLatitude,branchLongitude);
	}

	@PostMapping(value="/store/productInfoRegister.do")
	public String productInfoRegister(@RequestParam Map<String, String>params, @RequestParam(name = "photo", required = false) MultipartFile photo) {
			 logger.info("본사상품 등록");
		    logger.info("상품 정보 : "+params);
		    logger.info("사진 : "+photo);
		    if(photo!=null) {
		        service.productInfoRegister(params, photo);
		    }else{
		        service.productTicketInfoRegister(params);
		    }
		    return "store/store";
	}

	@PostMapping("/store/branchProductDelete.do")
	@ResponseBody
	public void branchProductDelete(@RequestParam int productID, @RequestParam int branchID) {
			logger.info("지점 상품 삭제");
			logger.info("productID : "+productID);
			logger.info("branchID : "+branchID);
			service.branchProductDelete(productID, branchID);
	}

	@GetMapping(value="/store/modalProductList.do")
	@ResponseBody
	public Map<String, Object> modalProductList(@RequestParam String currentBranchName){
		logger.info("모달 상품 리스트");
		return service.modalProductList(currentBranchName);
	}

	@PostMapping(value="/store/branchProductRegister.do")
	@ResponseBody
	public int branchProductRegister(@RequestParam String currentBranchName, @RequestParam String currentProductName) {
			logger.info("지점 상품 등록");
			logger.info("currentBranchName : "+currentBranchName);
			logger.info("currentProductName : "+currentProductName);
			return service.branchProductRegister(currentBranchName, currentProductName);
	}





}
