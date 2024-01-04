package kr.co.cocean.personnel.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.http.parser.MediaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.personnel.dto.HistoryDTO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.service.PersonnelService;
import kr.co.cocean.schedule.dto.ScheduleDTO;
import kr.co.cocean.schedule.service.ScheduleService;

@Controller
public class PersonnelController {
	
	@Autowired PersonnelService service;
	@Autowired ScheduleService scService;
	@Autowired PasswordEncoder encoder;
	Logger logger = LoggerFactory.getLogger(getClass());
	PersonnelDTO dto = new PersonnelDTO();
	
	@RequestMapping(value="/personnel/join.go")
	public String personnel() {
		
		return "personnel/personnel";
	}
	
    @GetMapping(value="/personnel/getBranchID.do")
	@ResponseBody
    public List<String> getBranchID(String branchID) {
        logger.info("지점번호 =="+branchID);
        List<String> teams = service.getBranchID(branchID);

		return teams;
	}
	
    @GetMapping(value="/personnel/getHqID.do")
	@ResponseBody
    public List<HashMap<String, Object>> getHqID(String hqID) {
        logger.info("val =="+hqID);
        List<HashMap<String, Object>>  res = service.getHqID(hqID);
        
		return res;
	}


    @RequestMapping(value="/personnel/getBranch.do")
    @ResponseBody
    public List<String> getBranch(){
        
        List<String> getbranch = service.getBranch();
        
        return getbranch;
    }
 
    
	@RequestMapping(value="/personnel/getDepartmentText.do")
	@ResponseBody
	public List<HashMap<String, Object>> getDepartmentText(String departmentText){
		
		List<HashMap<String, Object>> getDepartmentText = service.getDepartmentText(departmentText);
		
		return getDepartmentText;
	}
	@RequestMapping(value="/personnel/getChart.go")
	public String goChart() {
		
		return "personnel/organization";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/personnel/getChart.do" ,produces= {org.springframework.http.MediaType.APPLICATION_XML_VALUE, org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity getChart() {
		
		return new ResponseEntity(service.getChart(),HttpStatus.OK); 
	}
	
	@RequestMapping(value="/personnel/getEmployeeID.do")
	@ResponseBody
	public ModelAndView getEmployeeID(String employeeID) {
		logger.info("employeeID==========="+employeeID);
		ModelAndView mav = new ModelAndView("redirect:/schedule/schedule.go");
		return mav;
	}
	
	@RequestMapping(value="/personnel/personnelList.go")
	public ModelAndView personnelList() {
		
		ModelAndView mav = new ModelAndView("personnel/personnelList");
		 List<HashMap<String, Object>> list = service.personnelList();
		 for (HashMap<String, Object> hashMap : list) {
			 if(hashMap.get("departmentName").equals("-가산")) {
				 hashMap.put("departmentName", "-");
			 }
			 if(hashMap.get("departmentName").equals("-제주")) {
				 hashMap.put("departmentName", "-");
			 }
		}
		 mav.addObject("list", list);
		logger.info("list=="+list);
		return mav;
	}
	
	@GetMapping(value="/personnel/detail.go")
	public ModelAndView detail(@RequestParam int employeeID) {
		logger.info("employeeID" +employeeID);
		ModelAndView mav = new ModelAndView("personnel/personnelDetail");
		HashMap<String, Object> list = service.detail(employeeID);
		List<HashMap<String, Object>> employeeHistory = service.employeeHistory(employeeID);
		List<HashMap<String, Object>> workHistory = service.workHistory(employeeID);
		List<HashMap<String, Object>> departmentChangeLog = service.departmentChangeLog(employeeID);
		logger.info("@@@@@"+departmentChangeLog);
		logger.info("detailList=="+list);
		mav.addObject("person", list);
		mav.addObject("employeeHistory", employeeHistory);
		mav.addObject("workHistory", workHistory);
		mav.addObject("departmentChangeLog", departmentChangeLog);
		return mav;
	}
	
	@GetMapping(value="/personnel/getSelectOptionBranch.do")
	@ResponseBody
	public List<HashMap<String, Object>> getSelectOptionBranch(@RequestParam String selectedBranchValue){
		List<HashMap<String, Object>> list = service.getSelectOptionBranch(selectedBranchValue);
		for (HashMap<String, Object> hashMap : list) {
			 if(hashMap.get("departmentName").equals("-가산")) {
				 hashMap.put("departmentName", "-");
			 }
			 if(hashMap.get("departmentName").equals("-제주")) {
				 hashMap.put("departmentName", "-");
			 }
		}
		return list;
	}
	
	@GetMapping(value="/personnel/searchPerson.do")
	@ResponseBody
	public List<HashMap<String, Object>> searchPerson(String searchValue, String selectedOption){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		logger.info("aaa==="+selectedOption);
			 list= service.searchPerson(searchValue,selectedOption);
		
		
		return list;
	}
	
	@PostMapping(value="/personnel/checkDuplicateEmployeeID.do")
	@ResponseBody
	public Boolean checkDuplicateEmployeeID(String employeeID) {
		Boolean result = service.checkDuplicateEmployeeID(employeeID);
		logger.info("result!!! =="+result);
		return result;
	}
	
	@RequestMapping(value="/personnel/orgManage.go")
	public String orgManage() {
		
		return "personnel/orgManage";
	}
	@RequestMapping(value="/personnel/annualManage.go")
	public String annualManage() {
		
		return "personnel/annualManage";
	}
	
	@PostMapping(value="/personnel/getPositionName.do")
	@ResponseBody
	public List<HashMap<String, Object>> getPositionName(){
		
		List<HashMap<String, Object>> list = service.getPositionName();
		return list;
	}
	
	@PostMapping(value="/personnel/getRankName.do")
	@ResponseBody
	public List<HashMap<String, Object>> getRankName(){
		
		List<HashMap<String, Object>> list = service.getRankName();
		return list;
	}
	
	@PostMapping(value="/personnel/join.do")
	public ModelAndView join(@RequestParam("file") MultipartFile file ,@RequestParam("fileSignature")
	MultipartFile fileSignature ,@RequestParam HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		logger.info("files!!! : {}",file.getSize());
		logger.info("fileSignature!!! : {}",fileSignature.getSize());
		logger.info("params =="+params);
		String page= "";
		String pw = "cocean1111";
		
		String password = encoder.encode(pw);
		params.put("password", password);
		logger.info("aaa=="+params.get("positionID"));
		String status ="재직";
		params.put("status",status);
		params.put("remainingAnnualLeave", "0");

		int row= service.join(params,file,fileSignature);
		
		if(row>0) {
			String perNum = (String) params.get("employeeID");
			mav.setViewName("redirect:/personnel/personnelList.go");
		}else {
			mav.setViewName("redirect:/personnel/personnelList.go");
		}
		return mav;
	}
	
	

	@PostMapping(value="/personnel/detailSave.do")
	public ModelAndView historySave(@ModelAttribute HistoryDTO dto , @RequestParam int employeeID,
			 @RequestParam HashMap<String, Object> params , @RequestParam String tabID,
			 @RequestParam("file") MultipartFile file , @RequestParam("fileSignature") MultipartFile fileSignature) {
	    ModelAndView mav = new ModelAndView("redirect:/personnel/detail.go?employeeID=" + employeeID);
	    
	    HistoryDTO[] historyArray = dto.getHistoryArray();
	    HistoryDTO[] schistoryArray = dto.getSchistoryArray();
	    logger.info("tabId@@@@@@@@@@::"+tabID);
	    logger.info("params!!=="+params); 
	    logger.info("history"+dto.getHistoryArray());
	    logger.info("history"+dto.getStartDate());
	    String beforedpID =(String) params.get("beforeDpID");
	    String afterdpID = (String) params.get("departmentID");
	    for (HistoryDTO historyDTO : schistoryArray) {
			historyDTO.setCategory("학력");
		}
	    for (HistoryDTO historyDTO : historyArray) {
			historyDTO.setCategory("이력");
		}
	    logger.info("@@@@==" +historyArray[0].getCategory()); 
	    if(tabID.equals("workHistory")) {
	    	
	    	for (HistoryDTO history : historyArray) {
	    		// history 객체로부터 값 추출
	    		
	    		dto.setEmployeeID(employeeID);
	    		String startDate = history.getStartDate();
	    		String endDate = history.getEndDate();
	    		String organizationName = history.getOrganizationName();
	    		String remarks = history.getRemarks();
	    		String category = history.getCategory();
	    		// 추출한 값 로깅 또는 다른 작업 수행
	    		logger.info("Employee ID: " + employeeID);
	    		logger.info("Start Date: " + startDate);
	    		logger.info("End Date: " + endDate);
	    		logger.info("Organization Name: " + organizationName);
	    		logger.info("Remarks: " + remarks);
	    		
	    		// 이후에 수행할 작업을 여기에 추가
	    		int row =service.historySave(employeeID,startDate,endDate,organizationName,remarks,category);
	    	}
	    }
	    	
	    if (tabID.equals("history")) {
		          for (HistoryDTO schistory : schistoryArray) {
		        	  dto.setEmployeeID(employeeID);
		              String startDate = schistory.getStartDate();
		              String endDate = schistory.getEndDate();
		              String organizationName = schistory.getOrganizationName();
		              String remarks = schistory.getRemarks();
		              String sccategory = schistory.getCategory();
		              logger.info("Employee ID: " + employeeID);
		              logger.info("Start Date: " + startDate);
		              logger.info("End Date: " + endDate);
		              logger.info("Organization Name: " + organizationName);
		              logger.info("Remarks: " + remarks); 
		              int row =service.schistorySave(employeeID,startDate,endDate,organizationName,remarks,sccategory);
		  		}
	    	  }
				
				  if(tabID.equals("basic")) {
					  
				  int row = service.updateEmployee(employeeID,params);
				  if(row>0) {
					  service.updateEmployeeImg(employeeID,fileSignature,file);
					  service.writeDepartmentChangeLog(employeeID,beforedpID,afterdpID);
				  }
				 
					/* 
					 * if(row>0) {
					 * 
					 * 
					 * }
					 */
				  
				  }
				 
				 
	    
  	    
			return mav; 
      }
        

}
