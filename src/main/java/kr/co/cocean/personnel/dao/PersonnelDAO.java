package kr.co.cocean.personnel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.MultiValueMap;

import kr.co.cocean.main.dto.FileDTO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.TreeDTO;

@Mapper
public interface PersonnelDAO {


	int join(HashMap<String, Object> params);
	
    List<String> getBranch();



	List<TreeDTO> getChart();

	void joinTree(HashMap<String, Object> params);

	List<String> getBranchID(String branchID);

	List<String> getHqID(String hqID);

	List<String> getDepartmentText(String departmentText);

	List<HashMap<String, Object>> personnelList();

	List<HashMap<String, Object>> getSelectOptionBranch(String selectedBranchValue);

	List<HashMap<String, Object>> searchName(String searchValue);

	List<HashMap<String, Object>> searchEmployeeID(String searchValue);

	List<HashMap<String, Object>> searchPerson(String searchValue, String selectedOption);

	Boolean checkDuplicateEmployeeID(String employeeID);

	void upload(FileDTO dto);

	HashMap<String, Object> datail(int parsedEmployeeID);

	List<HashMap<String, Object>> employeeHistory(int employeeID);

	List<HashMap<String, Object>> workHistory(int employeeID);

	List<HashMap<String, Object>> getPositionName();

	List<HashMap<String, Object>> getRankName();

}
