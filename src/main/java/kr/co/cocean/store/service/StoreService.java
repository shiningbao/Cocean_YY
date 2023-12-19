package kr.co.cocean.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.store.dao.StoreDAO;
import kr.co.cocean.store.dto.StoreDTO;

@Service
public class StoreService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StoreDAO dao;
	
	StoreDTO storedto = new StoreDTO();
	
	public Map<String, Object> storeList() {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<StoreDTO> branchList = dao.branchList();
		map.put("branchList", branchList);
		logger.info("dto : "+branchList);
		logger.info("map :"+map);
		
	
		return map;
	}
	
	public JSONObject loadLocation() {

	    String REST_KEY = "01be87ade0ecf17b7ce8981fd0711323";
	    Double lat = {};
	    Double lon = {경도 좌표};
	    String url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=" + lon + "&y=" + lat;
	    
	    BufferedReader br = null;
	    JSONObject obj = new JSONObject();
	    ObjectMapper mapper = new ObjectMapper();
	    
	    try {
	        URL url = new URL(url);
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
	    
	    return obj;
	    
	}
}
