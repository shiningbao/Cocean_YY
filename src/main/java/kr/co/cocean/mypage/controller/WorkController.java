package kr.co.cocean.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.cocean.mypage.dto.LoginDTO;
import kr.co.cocean.mypage.dto.WorkDTO;
import kr.co.cocean.mypage.service.WorkService;

@Controller
public class WorkController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired WorkService service;


	@GetMapping(value="/mypage/work")
	   public String workco() {
	      return "mypage/work";
	   }




		@GetMapping(value="mypage/worklist")
		@ResponseBody
		public Map<String, Object> worklist(@RequestParam("pfirstsearchdate") String pfirstSearchDate,
			    @RequestParam("plastsearchdate") String plastSearchDate,HttpSession session){
			logger.info("work 컨트롤러 접속");
			LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
	        logger.info("userInfo: "+userInfo);
	        int userId = userInfo.getEmployeeID();
	        logger.info("userId:"+userId);
			return service.worklist(pfirstSearchDate,plastSearchDate,userId);
		}


	/*
	@GetMapping(value = "mypage/worklist")
	@ResponseBody
	public Map<String, Object> worklist(@RequestParam("pfirstsearchdate") String pfirstSearchDate,
	                                    @RequestParam("plastsearchdate") String plastSearchDate,
	                                    HttpSession session,
	                                    @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum) {
	    logger.info("work 컨트롤러 접속");
	    LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
	    logger.info("userInfo: " + userInfo);
	    int userId = userInfo.getEmployeeID();
	    logger.info("userId:" + userId);

	    // Service에서 직접 Map<String, Object>을 반환하도록 수정
	    return service.worklist(pfirstSearchDate, plastSearchDate, userId, pageNum);
	}
	*/
	/*
	@GetMapping(value="mypage/worklist")
	@ResponseBody
	public Map<String, Object> worklist(@RequestParam("pfirstsearchdate") String pfirstSearchDate,
		    @RequestParam("plastsearchdate") String plastSearchDate,HttpSession session,Pager pager){
		logger.info("work 컨트롤러 접속");
		LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
        logger.info("userInfo: "+userInfo);
        int userId = userInfo.getEmployeeID();
        logger.info("userId:"+userId);
		return service.worklist(pfirstSearchDate,plastSearchDate,userId);
	}*/




		//출근
		@PostMapping(value = "gocheck")
		@ResponseBody
		public Map<String, Object> gocheck(@RequestParam Map<String, String> requestData,
		                                   HttpSession session) {
		    logger.info("gocheck 컨트롤러 접속");

		    LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		    logger.info("userInfo: " + userInfo);

		    int userId = userInfo.getEmployeeID();
		    logger.info("userId: " + userId);

		    Map<String, Object> data = new HashMap<>();

		    // requestData로부터 timedata, datedata 추출
		    String timedata = requestData.get("timedata");
		    String datedate = requestData.get("datedate");
		    logger.info("timedata:"+timedata);
		    logger.info("datedate:"+datedate);


		 // Map에 추가
		    Map<String, String> timedataMap = new HashMap<>();
		    timedataMap.put("timedata", timedata);

		    Map<String, String> datedataMap = new HashMap<>();
		    datedataMap.put("datedate", datedate);

		    data.put("timedata", timedataMap);
		    data.put("datedate", datedataMap);



		    logger.info("data:" + data);


		    return service.gocheck(data, userId);
		}







		//퇴근(t)
		@PostMapping(value = "leavecheck")
		@ResponseBody
		public Map<String, Object> leavecheck(@RequestParam Map<String, String> leaveData,
		                                   HttpSession session) {
		    logger.info("leavecheck 컨트롤러 접속");

		    LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");
		    logger.info("userInfo: " + userInfo);

		    int userId = userInfo.getEmployeeID();
		    logger.info("userId: " + userId);

		    Map<String, Object> data = new HashMap<>();

		    // requestData로부터 timedata, datedata 추출
		    String timedata = leaveData.get("timedata");
		    String datedate = leaveData.get("datedate");
		    logger.info("timedata:"+timedata);
		    logger.info("datedate:"+datedate);


		 // Map에 추가
		    Map<String, String> timedataMap = new HashMap<>();
		    timedataMap.put("timedata", timedata);

		    Map<String, String> datedataMap = new HashMap<>();
		    datedataMap.put("datedate", datedate);

		    data.put("timedata", timedataMap);
		    data.put("datedate", datedataMap);



		    logger.info("data:" + data);


		    return service.leavecheck(data, userId);
		}








		// 세션에서 EmployeeID를 가져오는 컨트롤러 메서드
		@GetMapping(value = "getSessionEmployeeId")
		@ResponseBody
		public Map<String, Object> getSessionEmployeeId(HttpSession session) {
		    Map<String, Object> response = new HashMap<>();
		    LoginDTO userInfo = (LoginDTO) session.getAttribute("userInfo");

		    if (userInfo != null) {
		        response.put("employeeId", userInfo.getEmployeeID());
		    } else {
		        response.put("error", "EmployeeID not found in session");
		    }

		    return response;
		}



		


	}




