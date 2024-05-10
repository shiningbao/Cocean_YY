package kr.co.cocean.personnel.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.personnel.dto.HistoryDTO;
import kr.co.cocean.personnel.dto.PersonnelDTO;
import kr.co.cocean.personnel.dto.departmentDTO;
import kr.co.cocean.personnel.service.PersonnelService;
import kr.co.cocean.schedule.service.ScheduleService;
import kr.co.cocean.tank.dto.Pager;

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
    public List<HashMap<String, Object>> getBranchID(String branchID) {
        logger.info("지점번호 =="+branchID);
        List<HashMap<String, Object>> teams = service.getBranchID(branchID);

		return teams;
	}
    @GetMapping(value="/personnel/getBranchOrgID.do")
	@ResponseBody
    public List<HashMap<String, Object>> getBranchOrgID(String branchID) {
        logger.info("지점번호 =="+branchID);
        List<HashMap<String, Object>> teams = service.getBranchOrgID(branchID);

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
    public List<HashMap<String, Object>> getBranch(){
        
    	List<HashMap<String, Object>> getbranch = service.getBranch();
        
        return getbranch;
    }
 
    
	@RequestMapping(value="/personnel/getDepartmentText.do")
	@ResponseBody
	public List<HashMap<String, Object>> getDepartmentText(String departmentText){
		
		List<HashMap<String, Object>> getDepartmentText = service.getDepartmentText(departmentText);
		
		return getDepartmentText;
	}
	@RequestMapping(value="/personnel/organization/{isActive}")
	public String goChart(@PathVariable int isActive, Model model) {
		
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@조직도관리"+isActive);
		model.addAttribute("isActive", isActive);
		return "personnel/organization";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/personnel/getChart.do/{isActive}" ,produces= {org.springframework.http.MediaType.APPLICATION_XML_VALUE, org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity getChart(@PathVariable int isActive) {
		return new ResponseEntity(service.getChart(isActive),HttpStatus.OK); 
	}
	 
	@RequestMapping(value="/personnel/getEmployeeID.do")
	@ResponseBody
	public ModelAndView getEmployeeID(String employeeID) {
		logger.info("employeeID==========="+employeeID);
		ModelAndView mav = new ModelAndView("redirect:/schedule/schedule.go");
		return mav; 
	}
	
	@RequestMapping(value="/personnel/personnelList.go")
	public ModelAndView personnelList(@RequestParam HashMap<String, Object> params,Pager pager) {
		
		ModelAndView mav = new ModelAndView("personnel/personnelList");
		logger.info("params!@!@!@!"+params);
		 List<HashMap<String, Object>> list = service.personnelList(pager,params);
		 for (HashMap<String, Object> hashMap : list) {
			 if(hashMap.get("departmentName").equals("-가산")) {
				 hashMap.put("departmentName", "-");
			 }
			 if(hashMap.get("departmentName").equals("-제주")) {
				 hashMap.put("departmentName", "-");
			 } 
		}
		 logger.info("pager =="+pager.getCategory());
		 mav.addObject("pager", pager);
		 mav.addObject("list", list);
		logger.info("list=="+list);
		return mav;
	} 
//
//	@GetMapping(value="/personnel/getSelectOptionBranch.do")
//	@ResponseBody
//	public List<HashMap<String, Object>> getSelectOptionBranch(@RequestParam String selectedBranchValue){
//		List<HashMap<String, Object>> list = service.getSelectOptionBranch(selectedBranchValue);
//		for (HashMap<String, Object> hashMap : list) {
//			 if(hashMap.get("departmentName").equals("-가산")) {
//				 hashMap.put("departmentName", "-");
//			 }
//			 if(hashMap.get("departmentName").equals("-제주")) {
//				 hashMap.put("departmentName", "-");
//			 }
//		}
//		return list;
//	}

	
	
	@GetMapping(value="/personnel/detail.go")
	public ModelAndView detail(@RequestParam int employeeID) {
		logger.info("employeeID" +employeeID); 
		ModelAndView mav = new ModelAndView("personnel/personnelDetail");
		HashMap<String, Object> list = service.detail(employeeID);
		List<HashMap<String, Object>> employeeHistory = service.employeeHistory(employeeID);
		List<HashMap<String, Object>> workHistory = service.workHistory(employeeID);
		List<HashMap<String, Object>> departmentChangeLog = service.departmentChangeLog(employeeID);
		HashMap<String, Object> getEmployeeAnnual = service.getEmployeeAnnual(employeeID);
		logger.info("@@@@@"+departmentChangeLog);
		logger.info("detailList=="+list);
		mav.addObject("getEmployeeAnnual", getEmployeeAnnual);
		mav.addObject("person", list);
		mav.addObject("employeeHistory", employeeHistory);
		mav.addObject("workHistory", workHistory);
		mav.addObject("departmentChangeLog", departmentChangeLog);
		return mav;
	} 
	@PostMapping(value="/personnel/departmentChangeLog.do")
	@ResponseBody 
	public List<HashMap<String, Object>> departmentChangeLog(@RequestParam String employeeID){
		
		List<HashMap<String, Object>> list = service.departmentChangeLogAX(employeeID);
		return list;
	}
	@PostMapping(value="/personnel/ajaxGetHistory.do")
	@ResponseBody 
	public List<HashMap<String, Object>> ajaxGetHistory(@RequestParam String employeeID){
		
		List<HashMap<String, Object>> list = service.ajaxGetHistory(employeeID); 
		return list;
	}
	@PostMapping(value="/personnel/ajaxGetscHistory.do")
	@ResponseBody 
	public List<HashMap<String, Object>> ajaxGetscHistory(@RequestParam String employeeID){
		
		List<HashMap<String, Object>> list = service.ajaxGetscHistory(employeeID); 
		return list;
	}
	
	@PostMapping(value="/personnel/findAttend.do")
	@ResponseBody 
	public List<HashMap<String, Object>> findAttend(@RequestParam String employeeID , @RequestParam String startYear, @RequestParam String endYear){
		
		List<HashMap<String, Object>> list = service.findAttend(employeeID, startYear,endYear);
		return list;
	}
	

	
	@PostMapping(value="/personnel/checkDuplicateEmployeeID.do")
	@ResponseBody
	public Boolean checkDuplicateEmployeeID(String employeeID) {
		Boolean result = service.checkDuplicateEmployeeID(employeeID);
		logger.info("result!!! =="+result);
		return result;
	}
	
	@PostMapping(value="/personnel/checkDuplicateAddpositionID.do")
	@ResponseBody
	public Boolean checkDuplicateAddpositionID(String addpositionID) {
		Boolean result = service.checkDuplicateAddpositionID(addpositionID);
		logger.info("result!!! =="+result);
		return result; 
	}

	@PostMapping(value="/personnel/checkDuplicateAddRankID.do")
	@ResponseBody
	public Boolean checkDuplicateAddRankID(String addRankID) {
		Boolean result = service.checkDuplicateAddRankID(addRankID);
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
	
	@PostMapping(value="/personnel/getPositionNameOrg.do")
	@ResponseBody
	public List<HashMap<String, Object>> getPositionNameOrg(){
		
		List<HashMap<String, Object>> list = service.getPositionNameOrg();
		return list;
	}
	
	@PostMapping(value="/personnel/getPositionNameActive.do")
	@ResponseBody
	public List<HashMap<String, Object>> getPositionNameActive(){
		
		List<HashMap<String, Object>> list = service.getPositionNameActive();
		return list;
	}
	
	@PostMapping(value="/personnel/getRankName.do")
	@ResponseBody 
	public List<HashMap<String, Object>> getRankName(){
		
		List<HashMap<String, Object>> list = service.getRankName();
		return list;
	}
	
	@PostMapping(value="/personnel/getRankNameOrg.do")
	@ResponseBody 
	public List<HashMap<String, Object>> getRankNameOrg(){
		
		List<HashMap<String, Object>> list = service.getRankNameOrg();
		return list;
	}
	
	@PostMapping(value="/personnel/getRankNameActive.do")
	@ResponseBody
	public List<HashMap<String, Object>> getRankNameActive(){
		
		List<HashMap<String, Object>> list = service.getRankNameActive();
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

		int row= service.join(params,file,fileSignature);
		
		if(row>0) {
			String perNum = (String) params.get("employeeID");
			mav.setViewName("redirect:/personnel/personnelList.go?category=&inputSearch=&branch=0&pageNum=1");
		}else {
			mav.setViewName("redirect:/personnel/personnelList.go?category=&inputSearch=&branch=0&pageNum=1");
		}
		return mav;
	}
	
	

	@PostMapping(value="/personnel/detailSave.do")
	@ResponseBody
	public HashMap<String,Object> historySave(@ModelAttribute HistoryDTO dto , @RequestParam int employeeID,
			 @RequestParam HashMap<String, Object> params , @RequestParam String tabID,
			 @RequestParam("file") MultipartFile file , @RequestParam("fileSignature") MultipartFile fileSignature) {
//	    ModelAndView mav = new ModelAndView("redirect:/personnel/detail.go?employeeID=" + employeeID);
	    logger.info("dto ===" +dto);
	    HashMap<String, Object> response = new HashMap<String, Object>();
	    HistoryDTO[] historyArray = dto.getHistoryArray();
	   
	    logger.info("historyArray@@@@@@@@@@::"+historyArray.length);
	    HistoryDTO[] schistoryArray = dto.getSchistoryArray();
	    logger.info("schistoryArray@@@@@@@@@@::"+schistoryArray.length);
	    logger.info("tabId@@@@@@@@@@::"+tabID);
	    logger.info("params!!=="+params); 
	    logger.info("history"+dto.getHistoryArray());
	    logger.info("history"+dto.getStartDate());
	    String beforedpID =(String) params.get("beforeDpID");
	    String afterdpID = (String) params.get("departmentID");
	    
	    if(tabID.equals("workHistory")) {
	    	for (HistoryDTO history : historyArray) {
	    		// history 객체로부터 값 추출
	    		logger.info("이력 머지??? =="+history);
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
	    		if(row>0) {
	    			response.put("tabID", tabID);
	    		}
	    	}
	    }
	    if(tabID.equals("history")){
	          for (HistoryDTO schistory : schistoryArray) {
	        	  logger.info("머지?? =="+schistory);
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
	              if(row>0) {
		    			response.put("tabID", tabID);
		    		}
	          }
	    }
	    if(tabID.equals("basic")) {
	  	  	  logger.info("basic접근");
			  int row = service.updateEmployee(employeeID,params);
			  service.updateEmployeeImg(employeeID,fileSignature,file);
			  if(row>0) {
				  logger.info("변경전 부서"+beforedpID+ "변경 후 부서"+afterdpID);
				  response.put("tabID", tabID);
				  if(!beforedpID.equals(afterdpID)) {
					  service.writeDepartmentChangeLog(employeeID,beforedpID,afterdpID);
				  } 
				 
			  }
	    }
	    if(tabID.equals("info")) {
	    	
	    	service.updateinfo(employeeID,params);
	    	response.put("tabID", tabID);
	    }


				 
	    
  	    
			return response; 
      }
	@PostMapping(value="/personnel/resetPassword.do")
	@ResponseBody
	public String resetPassword(@RequestParam String employeeID) {
		String pw = "cocean1111";
		String password = encoder.encode(pw);
		service.resetPassword(password,employeeID);
		return "success";
	}
	
	
	@PostMapping(value="/personnel/getEmployeeInfo.do")
	@ResponseBody
	public HashMap<String, Object> getEmployeeInfo(@RequestParam String employeeID,@RequestParam String nodeText) {
		logger.info("조직관리 =="+employeeID);
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(employeeID.matches("\\d+")&&(employeeID.startsWith("br"))) {
			boolean nodata = false;
			result.put("nodata", nodata);
		}else if(employeeID.startsWith("de")) {
			String departmentID =employeeID.substring(2);
			HashMap<String, Object> dpInfo = service.getdepartmentInfo(departmentID);
			
			 int  thisDepartmentMembers =service.getDepartmentMembers(departmentID);
			 result.put("thisDepartmentMembers", thisDepartmentMembers);
			 
			result.put("dpInfo", dpInfo);
		}else if(employeeID.startsWith("hq")) {
			String hqID =employeeID.substring(2);
			HashMap<String, Object> hqInfo = service.gethqInfo(hqID);
			int  thisHqMembers =service.getHqMembers(hqID);
			 result.put("thisHqMembers", thisHqMembers);
			result.put("hqInfo", hqInfo);
		}
		
		
		return result;
	}
	@PostMapping(value = "/personnel/updateRank.do")
	@ResponseBody
	public HashMap<String, Object> editRankInfo(@RequestParam String rankID,
	                                       @RequestParam String rankName,
	                                       @RequestParam Boolean isActive) {   
	    logger.info("직급 수정 요청 - rankID: " + rankID + ", rankName: " + rankName + ", isActive: " + isActive);

	    HashMap<String, Object> response = new HashMap<String, Object>();
	    
	     Integer row = service.updateRank(rankID,rankName,isActive);

	     response.put("message", "수정이 완료되었습니다."); 
	    return response; 
	}
	
	@PostMapping(value = "/personnel/updatePosition.do")
	@ResponseBody
	public HashMap<String, Object> updatePosition(@RequestParam String positionID,
	                                       @RequestParam String positionName,
	                                       @RequestParam Boolean isActive) {   
	    logger.info("직급 수정 요청 - positionID: " + positionID + ", rankName: " + positionName + ", isActive: " + isActive);

	    HashMap<String, Object> response = new HashMap<String, Object>();
	     
	    service.updatePosition(positionID,positionName,isActive);

	     response.put("message", "수정이 완료되었습니다."); 
	    return response; 
	}
	@PostMapping(value = "/personnel/addPostion.do")
	@ResponseBody
	public HashMap<String, Object> addPostion(@RequestParam String positionID,
            @RequestParam String positionName,
            @RequestParam Boolean isActive) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		service.addPostion(positionID,positionName,isActive);
		
		response.put("message", "생성이 완료되었습니다."); 
		return response; 
		}
	@PostMapping(value = "/personnel/addRank.do")
	@ResponseBody
	public HashMap<String, Object> addRank(@RequestParam String rankID,
            @RequestParam String rankName,
            @RequestParam Boolean isActive) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		service.addRank(rankID,rankName,isActive);
		
		response.put("message", "생성이 완료되었습니다."); 
		return response; 
		}
	@PostMapping(value = "/personnel/addDepartment.do")
	@ResponseBody
	public HashMap<String, Object> addDepartment(
			@RequestParam String hqID, 	@RequestParam String departmentName,	
			@RequestParam Boolean isActive,
            @RequestParam(value="responsibility[]") List<String> responsibility) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		departmentDTO dto = new departmentDTO();
		dto.setHqID(hqID);
		dto.setDepartmentName(departmentName); 
		dto.setIsActive(isActive); 
		service.addDepartment(dto);
		logger.info("dto아이디확인=="+dto.getDepartmentID());
		String departmentID = dto.getDepartmentID(); 
		for (String responName : responsibility) {
			service.addResponsibiliy(departmentID,responName);
		}
		response.put("message", "생성이 완료되었습니다."); 
		return response; 
		}   
	@PostMapping(value = "/personnel/addhq.do") 
	@ResponseBody
	public HashMap<String, Object> addhq(@RequestParam String branchID,
            @RequestParam String hqName,
            @RequestParam Boolean isActive) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		service.addhq(branchID,hqName,isActive);
		
		response.put("message", "생성이 완료되었습니다."); 
		return response; 
		}
	
	@PostMapping(value = "/personnel/editHq.do")
	@ResponseBody
	public HashMap<String, Object> editHq( @RequestParam String hqID,
            @RequestParam String hqName,
            @RequestParam Boolean isActive) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		service.editHq(hqID,hqName,isActive);
		
		response.put("message", "수정이 완료되었습니다."); 
		return response; 
		}
	
	@PostMapping(value = "/personnel/editDp.do")
	@ResponseBody
	public HashMap<String, Object> editDp( @RequestParam String departmentID,
            @RequestParam String departmentName,
            @RequestParam Boolean isActive) {   
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		service.editDp(departmentID,departmentName,isActive);
		
		response.put("message", "수정이 완료되었습니다."); 
		return response; 
		}
	@PostMapping(value="/personnel/annualLeave.do")
	@ResponseBody
	public List<HashMap<String, Object>> annualLeave( @RequestBody List<HashMap<String, Integer>> dataList){
			
			List<HashMap<String,Object>> leaveYears = service.leaveYears();
			logger.info("leaveYears =="+leaveYears);
			SimpleDateFormat formmater = new SimpleDateFormat("yyyy-MM-dd");
		
		
		for (HashMap<String, Integer> dataMap : dataList) {
	        Integer year = dataMap.get("year");
	        Integer value = dataMap.get("value");
	        // year와 value를 활용한 로직 수행
	        
	        
	     
		}
		service.saveAnnualLeave(dataList);
		List<HashMap<String, Object>> result = service.getAnnualLeave();
		/* service.updateAnnual(dataList); */

		return result;
	}
	@PostMapping(value="/personnel/getAnnualLeave.do")
	@ResponseBody
	public List<HashMap<String, Object>> getAnnualLeave(){
		List<HashMap<String, Object>> result = service.getAnnualLeave();
		
		return result;
	}
	
	@PostMapping(value="/personnel/delHistory.do")
	@ResponseBody
	public HashMap<String, Object> delHistory (@RequestParam String historyID) {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		int row = service.delHistory(historyID);
		if(row>0) {
			
		}else {
		}
		
		return response;
	}
	@PostMapping(value="/personnel/delscHistory.do")
	@ResponseBody
	public HashMap<String, Object> delscHistory (@RequestParam String historyID) {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		int row = service.delscHistory(historyID);
		if(row>0) {
			
			response.put("message", "삭제 성공");
		}else {
			response.put("message", "삭제 실패");
		}
		
		return response;
	}
	@PostMapping(value="/personnel/delDepartmentLog.do")
	@ResponseBody
	public HashMap<String, Object> delDepartmentLog (@RequestParam String logID) {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		int row = service.delDepartmentLog(logID);
		if(row>0) {
			
			response.put("message", "삭제 성공");
		}else {
			response.put("message", "삭제 실패");
		}
		
		return response;
	}
	// 매년 1월1일 00:01분 근속년수별 연차업데이트
	@Scheduled(cron = "0 1 0 1 1 ?")
	public void updateAnnual() {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<HashMap<String, Object>> getYearValue = service.getYearValue();
		
		for (HashMap<String, Object> hashMap : getYearValue) {
			 String year = (String) hashMap.get("year");
		        String value = (String) hashMap.get("value");
		        logger.info("year =="+year +"// value ==" + value);
		        service.updateAnnual(year,value); 
		}
		
	}	
	// 매년 1월1일 모든사원 연차 0으로
	@Scheduled(cron = "0 0 1 1 * ?")
	public void calculateAnnualLeave() {

		service.updateEmployeeAnnual();
		
	}

}
