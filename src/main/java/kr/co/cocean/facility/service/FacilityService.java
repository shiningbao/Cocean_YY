package kr.co.cocean.facility.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.facility.dao.FacilityDAO;

@Service
public class FacilityService {
	@Autowired FacilityDAO dao;

	public List<HashMap<String, Object>> getCategory() {
		// TODO Auto-generated method stub
		return dao.getCategory();
	}

	public List<HashMap<String, Object>> getfacilityInfo() {
		// TODO Auto-generated method stub
		return dao.getfacilityInfo();
	}

	public List<HashMap<String, Object>> getfacilityName(String category) {
		return dao.getfacilityName(category);
	}

	public HashMap<String, Object> getfacilityInfo(String facilityName) {
		// TODO Auto-generated method stub
		return dao.getfacilityInfo(facilityName);
	}

	public HashMap<String, Object> getPersonnelLeader() {
		// TODO Auto-generated method stub
		return dao.getPersonnelLeader();
	}

	public void updateFacilityName(String facilityName, String facilityInfo, String facilityID) {

		dao.updateFacilityName(facilityName,facilityInfo,facilityID);
	}

	public void delFacility(String deltxt) {

		dao.delFacility(deltxt);
	}

	public void addFacility(String category, String facilityName, String facilityInfo) {

		dao.addFacility(category,facilityName,facilityInfo);
	}

}
