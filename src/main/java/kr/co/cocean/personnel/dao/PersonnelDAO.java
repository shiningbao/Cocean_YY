package kr.co.cocean.personnel.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;

import kr.co.cocean.main.dto.FileDTO;
import kr.co.cocean.personnel.dto.HistoryDTO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.TreeDTO;
import kr.co.cocean.personnel.dto.departmentDTO;

@Mapper
public interface PersonnelDAO {


	int join(HashMap<String, Object> params);
	
    List<HashMap<String, Object>> getBranch();



	List<TreeDTO> getChart(int isActive);

	void joinTree(HashMap<String, Object> params);

	List<HashMap<String, Object>> getBranchID(String branchID);

	List<HashMap<String, Object>> getHqID(String hqID);

	List<HashMap<String, Object>> getDepartmentText(String departmentText);

	List<HashMap<String, Object>> personnelList(HashMap<String, Object> params);

	List<HashMap<String, Object>> getSelectOptionBranch(String selectedBranchValue);

	List<HashMap<String, Object>> searchName(String searchValue);

	List<HashMap<String, Object>> searchEmployeeID(String searchValue);

	List<HashMap<String, Object>> searchPerson(String searchValue, String selectedOption, int pageNum, int count);

	Boolean checkDuplicateEmployeeID(String employeeID);

	void upload(FileDTO dto);

	HashMap<String, Object> detail(int parsedEmployeeID);

	List<HashMap<String, Object>> employeeHistory(int employeeID);

	List<HashMap<String, Object>> workHistory(int employeeID);

	List<HashMap<String, Object>> getPositionName();

	List<HashMap<String, Object>> getRankName(); 

	List<HashMap<String, Object>> departmentChangeLog(int employeeID);

	int historySave(HistoryDTO dto, int employeeID);

	int historySave(int employeeID, String startDate, String endDate, String organizationName, String remarks,
			String category);

	int schistorySave(int employeeID, String startDate, String endDate, String organizationName, String remarks,
			String sccategory);

	void update(FileDTO dto);


	int updateEmployeeInfo(int employeeID, String positionID, String status, String departmentID, String rankID,
			String responID);

	void writeDepartmentChangeLog(int employeeID, String beforedpID, String afterdpID);

	void resetPassword(String password, String employeeID);

	HashMap<String, Object> getdepartmentInfo(String departmentID);

	HashMap<String, Object> gethqInfo(String hqID);

	Integer updateRank(String rankID, String rankName, Boolean isActive);

	void updatePosition(String positionID, String positionName, Boolean isActive);

	void addPostion(String positionID, String positionName, Boolean isActive);

	Boolean checkDuplicateAddpositionID(String addpositionID);

	void addRank(String rankID, String rankName, Boolean isActive);

	Boolean checkDuplicateAddRankID(String addRankID);

	List<HashMap<String, Object>> getRankNameActive();

	List<HashMap<String, Object>> getPositionNameActive();

	int addDepartment(departmentDTO dto);

	List<HashMap<String, Object>> getBranchOrgID(String branchID);

	void addhq(String branchID, String hqName, Boolean isActive);

	void updateInfo(int employeeID, String address, String name, String phoneNumber);

	void editHq(String hqName, String hqID, Boolean isActive);

	void editDp(String departmentName, String departmentID, Boolean isActive);

	int getDepartmentMembers(String departmentID);

	void addResponsibiliy(String departmentID, String responName);

	Integer totalCountSearch(HashMap<String, Object> params);

	void updateEmployeeAnnual();

	List<HashMap<String, Object>> leaveYears();

	void updateAnnual(List<HashMap<String, Integer>> dataList);

	void saveAnnualLeave(List<HashMap<String, Integer>> dataList);

	List<HashMap<String, Object>> getYearValue();

	void updateAnnual(String year, String value);

	HashMap<String, Object> getEmployeeAnnual(int employeeID);

	List<HashMap<String, Object>> findAttend(String employeeID, String startYear, String endYear);

	int delHistory(String historyID);

	int delscHistory(String historyID);

	int delDepartmentLog(String logID);

	List<HashMap<String, Object>> departmentChangeLogAX(String employeeID);

	List<HashMap<String, Object>> ajaxGetHistory(String employeeID);

	List<HashMap<String, Object>> ajaxGetscHistory(String employeeID);

	int getHqMembers(String hqID);

	List<HashMap<String, Object>> getRankNameOrg();

	List<HashMap<String, Object>> getPositionNameOrg();

	List<HashMap<String, Object>> getAnnualLeave();


}
