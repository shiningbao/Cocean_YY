package kr.co.cocean.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.personnel.dto.PersonnelDTO;

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


	List<String> getHqID(String hqID);

	List<String> getDepartmentText(String departmentText);

}
