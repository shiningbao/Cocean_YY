package kr.co.cocean.store.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.store.dto.StoreDTO;
import kr.co.cocean.store.dto.StoreProductDTO;
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
	
	@GetMapping(value="/store/branchRegister.do")
	@ResponseBody
	public String brachRegister(HttpSession session,RedirectAttributes rAttr, @RequestParam String branchName,@RequestParam String branchLocation, @RequestParam double branchLatitude, @RequestParam double branchLongitude) {
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		String responseName = dto.getResponName();
		logger.info("담당명 :  " + responseName);
		// 해당 지점의 마케팅 담당자만 가능
		if(responseName.equals("마케팅")) {
			
		}else {
			rAttr.addAttribute("msg", "마케팅 담당자만 등록할 수 있습니다");
		}
		logger.info("지점 등록");
		logger.info("branchName : "+branchName);
		logger.info("branchLocation : "+branchLocation);
		logger.info("branchLatitude : "+branchLatitude);
		logger.info("branchLongitude : "+branchLongitude);
		return service.brachRegister(branchName, branchLocation, branchLatitude,branchLongitude);
	}
	
	@GetMapping(value="/store/productInfoRegister.go")
	public String productInfoRegisterLoad() {
		logger.info("상품 등록 페이지 이동");
		return "store/productInfoRegister";
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
