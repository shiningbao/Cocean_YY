package kr.co.cocean.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.MultiValueMap;

import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.TreeDTO;

@Mapper
public interface PersonnelDAO {


	int join(HashMap<String, Object> params);

//
//
//	void addMyCallendar(String perNum, String myCallender);
//
//	void addRsvCallendar(String perNum, String rsvCallendar);

	List<String> getBranch();


	List<String> getBranchID(String branchID);
	




	List<TreeDTO> getChart();

	void joinTree(HashMap<String, Object> params);

	List<String> getHqID(String hqID);

	List<String> getDepartmentText(String departmentText);

}
