package kr.co.cocean.store.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.cocean.store.dao.StoreDAO;
import kr.co.cocean.store.dto.StoreDTO;

@Service
public class StoreService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreDAO dao;
	
//	StoreDTO storedto = new StoreDTO();
//	
//	public Map<String, Object> storeList() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		ArrayList<StoreDTO> branchList = dao.branchList();
//		map.put("branchList", branchList);
//		logger.info("dto : "+branchList);
//		logger.info("map :"+map);
//		
//	
//		return map;
//	}
	
	public JSONObject loadLocation(Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> branchList = dao.branchList();
		
		map.put("branchList", branchList);
		
		// 카카오 REST api key
	    String REST_KEY = "01be87ade0ecf17b7ce8981fd0711323";
	    Double lat = branchList.get(0).getBranchLatitude();
	    Double lon = branchList.get(0).getBranchLongitude();
	    logger.info("lat/lon "+lat+"/"+lon);
	    String api_url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=" + lon + "&y=" + lat;
	    BufferedReader br = null;
	    JSONObject obj = new JSONObject();
	    ObjectMapper mapper = new ObjectMapper();
	    try {
	        URL url = new URL(api_url);
	        URLConnection conn = url.openConnection();
	        conn.setRequestProperty("Authorization", "KakaoAK " + REST_KEY);
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        if(br != null) obj = mapper.readValue(br, JSONObject.class);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            br.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    logger.info("obj = "+obj.toString());
	    model.addAttribute("branch",obj);
	    return obj;
	    
	}
}
