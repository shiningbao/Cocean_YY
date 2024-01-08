package kr.co.cocean.facility.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacilityDAO {

	List<HashMap<String, Object>> getCategory();

	
	List<HashMap<String, Object>> getfacilityInfo();

	List<HashMap<String, Object>> getfacilityName(String category);


	HashMap<String, Object> getfacilityInfo(String facilityName);


	HashMap<String, Object> getPersonnelLeader();


	void updateFacilityName(String facilityName, String facilityInfo, String facilityID);


	void delFacility(String deltxt);

 
	void addFacility(String category, String facilityName, String facilityInfo);
}