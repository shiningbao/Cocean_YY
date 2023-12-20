package kr.co.cocean.store.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.cocean.store.dao.StoreDAO;
import kr.co.cocean.store.dto.StoreDTO;

@Service
public class StoreService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreDAO dao;
	
	StoreDTO storedto = new StoreDTO();
	
	public Map<String, Object> storeList(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> branchList = dao.branchList();
		map.put("branchList", branchList);
		model.addAttribute("branchList",branchList);
		return map;
	}
	
	public JSONObject loadLocation(Model model) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    ArrayList<StoreDTO> branchList = dao.branchList();
	    map.put("branchList", branchList);
	    model.addAttribute("branchList", branchList);
	    
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

}
