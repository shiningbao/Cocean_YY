package kr.co.cocean.personnel.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.UploadContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import kr.co.cocean.main.dto.FileDTO;
import kr.co.cocean.personnel.dao.PersonnelDAO;
import kr.co.cocean.personnel.dto.HistoryDTO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.TreeDTO;

@Service
public class PersonnelService {
	private String root = "C:/upload/cocean/";
	@Autowired PersonnelDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public int join(HashMap<String, Object> params, MultipartFile file, MultipartFile fileSignature) {
		String dpID = (String) params.get("departmentID");
		String rsID = (String) params.get("responsibility");
		logger.info("join 서비스접근 "+ params.get("employeeID"));
		logger.info("담당확인" + params.get("responsibility"));


		String employeeIDString = (String) params.get("employeeID");
		int employeeID = Integer.parseInt(employeeIDString);
		if(file.getSize()!=0) {
			UploadContext(file,employeeID);
		}
		if(fileSignature.getSize()!=0) {
			
			UploadSgniture(fileSignature,employeeID);
		}
		
		return dao.join(params);
	}
    private void UploadSgniture(MultipartFile fileSignature, int employeeID) {
    	FileDTO dto = new FileDTO();
    	String oriFileName = fileSignature.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		dto.setCategory("사원관리");
		dto.setIdx(employeeID);
		dto.setPath("signature");
		dto.setServerFileName(newFileName);
		dto.setOriFileName(oriFileName);
		dao.upload(dto);
		
		try {
			byte[] bytes = fileSignature.getBytes();
			Path path = Paths.get(root+"personnel/"+newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void UploadContext(MultipartFile file, int employeeID) {
    	FileDTO dto = new FileDTO();
    	String oriFileName = file.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		dto.setCategory("사원관리");
		dto.setIdx(employeeID);
		dto.setPath("profile");
		dto.setServerFileName(newFileName);
		dto.setOriFileName(oriFileName);
		dao.upload(dto);
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(root+"personnel/"+newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<String> getBranch() {
        return dao.getBranch();
    }

	
	
	
	public List<String> getBranchID(String branchID) {
		// TODO Auto-generated method stub
		return dao.getBranchID(branchID);
	}
	public List<HashMap<String, Object>> getHqID(String hqID) {
		return dao.getHqID(hqID);
	}
	public List<HashMap<String, Object>> getDepartmentText(String departmentText) {
		return dao.getDepartmentText(departmentText);
	}
	public List<TreeDTO> getChart() {
		return dao.getChart();
	}

	
	public void joinTree(HashMap<String, Object> params) {
		String positionID = String.valueOf(params.get("positionID"));
		String branchID = String.valueOf(params.get("branchID"));
		if(branchID.equals("1") && positionID.equals("4") ) {
			params.put("departmentID", "branch1");
		}
		if(branchID.equals("2") && positionID.equals("4") ) {
			params.put("departmentID", "branch2");
		}
		if (positionID.equals("1")) {
			params.put("positionID", "팀원");
		} else if (positionID.equals("2")) {
			params.put("positionID", "팀장");
		} else if (positionID.equals("3")) {
			params.put("positionID", "본부장");
		} else if (positionID.equals("4")) {
			params.put("positionID", "관장");
		} else if (positionID.equals("5")) {
			params.put("positionID", "대표이사");
			params.put("departmentID", "#");
		}
		dao.joinTree(params);
		logger.info("Tree구조확인 params" + params);
	}
	 
	public List<HashMap<String, Object>> personnelList() {
		return dao.personnelList();
	}
	public List<HashMap<String, Object>> getSelectOptionBranch(String selectedBranchValue) {
		if(selectedBranchValue.equals("지점")) {
		}
		return dao.getSelectOptionBranch(selectedBranchValue);
	}

	public List<HashMap<String, Object>> searchPerson(String searchValue, String selectedOption) {
		// TODO Auto-generated method stub
		return dao.searchPerson(searchValue,selectedOption);
	}
	public Boolean checkDuplicateEmployeeID(String employeeID) {
		return dao.checkDuplicateEmployeeID(employeeID);
	}
	public HashMap<String, Object> detail(int parsedEmployeeID) {
		return dao.datail(parsedEmployeeID);
	}
	public List<HashMap<String, Object>> employeeHistory(int employeeID) {
		return dao.employeeHistory(employeeID);
	}
	public List<HashMap<String, Object>> workHistory(int employeeID) {
		return dao.workHistory(employeeID);
	}
	public List<HashMap<String, Object>> getPositionName() {
		return dao.getPositionName();
	}
	public List<HashMap<String, Object>> getRankName() {
		// TODO Auto-generated method stub
		return dao.getRankName();
	}
	public List<HashMap<String, Object>> departmentChangeLog(int employeeID) {
		return dao.departmentChangeLog(employeeID);
	}

	public int historySave(int employeeID, String startDate, String endDate, String organizationName, String remarks,
			String category) {
		return dao.historySave(employeeID,startDate,endDate,organizationName,remarks,category);
	}
	public int schistorySave(int employeeID, String startDate, String endDate, String organizationName, String remarks,
			String sccategory) {
		return dao.schistorySave(employeeID,startDate,endDate,organizationName,remarks,sccategory);
	}

	

}
