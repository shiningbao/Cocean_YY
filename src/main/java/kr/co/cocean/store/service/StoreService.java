package kr.co.cocean.store.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.cocean.store.dao.StoreDAO;
import kr.co.cocean.store.dto.StoreDTO;
import kr.co.cocean.store.dto.StoreProductDTO;

@Service
public class StoreService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreDAO dao;
	
	StoreDTO storedto = new StoreDTO();
	// 상품 사진 경로
	// mac 경로
	//	private String root = "/Users/chajaeho/Desktop/upload/cocean/";
	
	// window 경로
	private String root = "C:/upload/cocean/";
	
	// 카카오 지도 api 사용
	public JSONObject kakaoAPi(Model model) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    ArrayList<StoreDTO> branchList = dao.branchList();
	    
	    // 카카오 REST api key
	    String REST_KEY = "01be87ade0ecf17b7ce8981fd0711323";
	    Double lat = branchList.get(0).getBranchLatitude();
	    Double lon = branchList.get(0).getBranchLongitude();
	    logger.info("lat/lon " + lat + "/" + lon);
	    String api_url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=" + lon + "&y=" + lat;
	    BufferedReader br = null;
	    JSONObject obj = new JSONObject();
	    
	    ObjectMapper mapper = new ObjectMapper();
	    try {
	        URL url = new URL(api_url);
	        URLConnection conn = url.openConnection();
	        conn.setRequestProperty("Authorization", "KakaoAK " + REST_KEY);
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        if (br != null) obj = mapper.readValue(br, JSONObject.class);

	        // obj에서 documents 가져오기
	        List<Map<String, Object>> documents = (List<Map<String, Object>>) obj.get("documents");

	        if (documents != null && !documents.isEmpty()) {
	            Map<String, Object> firstDocument = documents.get(0);

	            // 첫번째 x와 y 값을 branchList의 lat와 lon 값으로 업데이트
	            firstDocument.put("x", lon);
	            firstDocument.put("y", lat);

	            // x와 y 값 출력
	            logger.info("Updated x: " + firstDocument.get("x"));
	            logger.info("Updated y: " + firstDocument.get("y"));

	            // 여기서 x와 y 값을 수정하거나 다른 작업 수행 가능
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            br.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    logger.info("obj = " + obj.toString());
	    
	    return obj;
	}
	
	public Map<String, Object> storeList(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreProductDTO> branchProductList = dao.branchProductList();
		ArrayList<StoreDTO> branchList = dao.branchList();
		ArrayList<StoreProductDTO> totalProductNumber = dao.totalProductNumber();
		map.put("branchProductList", branchProductList);
		map.put("branchList", branchList);
		map.put("totalProductNumber", totalProductNumber);
		return map;
	}

	// 상품 검색 리스트 보여주기용
	public Map<String, Object> searchProduct(String searchKeyword, String branchName) {
		Map<String, Object> map =  new HashMap<String, Object>();
		ArrayList<StoreProductDTO> list = dao.searchProduct(searchKeyword, branchName);
		if(list.get(0).getStatus()==null) {
			list.get(0).setStatus(branchName);
		}
		map.put("searchedList", list);
		logger.info("list : "+list);
		return map;
	}

	public String brachRegister(String branchName, String branchLocation, double branchLatitude, double branchLongitude) {
		dao.brachRegister(branchName, branchLocation, branchLatitude, branchLongitude);
		int branchID = dao.branchSelect(branchName);
		for (int i = 1;  i< 5; i++) {
			 dao.branchRegisterProduct(branchID, i);
		}
		return "성공";
	}

	public Map<String, Object> modalProductList(String currentBranchName) {
		Map<String, Object> map =  new HashMap<String, Object>();
		ArrayList<StoreProductDTO> list = dao.modalProductList(currentBranchName);
		map.put("modalSearchedList", list);
		return map;
	}
	
	public Map<String, Object> modalTicketList(String currentBranchName) {
		Map<String, Object> map =  new HashMap<String, Object>();
		ArrayList<StoreProductDTO> list = dao.modalTicketList(currentBranchName);
		map.put("modalSearchedList", list);
		return map;
	}

	public int branchProductRegister(String currentBranchName, String currentProductName) {
		int branchID = dao.branchIDSearch(currentBranchName);
		int productID = dao.productIDSearch(currentProductName);
		logger.info("productID : "+productID);
		return dao.branchProductRegister(branchID, productID);
	}
	public ModelAndView storeProductDetail(int productID) {
		ModelAndView mav = new ModelAndView();
		StoreProductDTO list = dao.storeProductDetail(productID);
		list.setBranchID(1);
		mav.addObject("list",list);
		mav.setViewName("store/storeProductDetail");
		return mav;
	}
	
	public ModelAndView storeProductDetail(int productID, int branchID) {
		ModelAndView mav = new ModelAndView();
		StoreProductDTO list = dao.storeProductDetail(productID);
	   list.setBranchID(branchID);
		mav.addObject("list",list);
		mav.setViewName("store/storeProductDetail");
		return mav;
	}

	public int productInfoRegister(Map<String, String> params, MultipartFile photo) {
		int fileupload = 0;
		dao.productInfoRegister(params);
		int productID = dao.productInfoID(params.get("productName"));
		dao.branchProductRegister(1, productID);
		String oriFileName = photo.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		logger.info("사진 : "+photo);
		logger.info("서버파일네임");
		logger.info(newFileName);
		logger.info("원래파일명");
		logger.info(oriFileName);
		
		if(photo.getSize()!=0) {
			try {
				byte[] bytes = photo.getBytes();
				Path path = Paths.get(root+"product/"+newFileName);
				Files.write(path, bytes);
				fileupload = dao.productFileRegister("상품", productID, "product", newFileName, oriFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileupload;
	}

	public int productTicketInfoRegister(Map<String, String> params) {
		logger.info("티켓 등록");
		int result = dao.productInfoRegister(params);
		int productID = dao.productInfoID(params.get("productName"));
		dao.branchProductRegister(1, productID);
		return result;
	}

	public void branchProductDelete(int productID, int branchID) {
		 dao.branchProductDelete(productID, branchID);
	}

	

	

	


}
