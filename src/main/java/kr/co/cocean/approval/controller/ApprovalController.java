package kr.co.cocean.approval.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.dto.LineDTO;
import kr.co.cocean.approval.dto.formDTO;
import kr.co.cocean.approval.service.ApprovalService;
import kr.co.cocean.mypage.dto.LoginDTO;

@Controller
public class ApprovalController {
	Logger logger = LoggerFactory.getLogger(getClass());
	private String root = "C:/upload/cocean/";

	@Autowired
	ApprovalService service;

	@GetMapping(value = "/approval/formList.go")
	public ModelAndView formList(HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		
		if (dto != null) {
			ArrayList<formDTO> list = service.list();
			mav.addObject("list", list);
			mav.setViewName("approval/formList");
		} else {
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
		}
		return mav;
	}

	@GetMapping(value = "/approval/waitingList.go")
	public ModelAndView waitingList(HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		if (dto != null) {
			int employeeID = dto.getEmployeeID();
			ArrayList<ApprovalDTO> list = service.waitingList(employeeID);
			mav.addObject("list", list);
			mav.setViewName("approval/waitingList");
		} else {
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
		}
		return mav;
	}

	@GetMapping(value = "/approval/draftDetail.go")
	public ModelAndView draftDetail(HttpSession session, RedirectAttributes rAttr, @RequestParam int idx, int employeeID) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		if (dto != null) {
			int loginId = dto.getEmployeeID();
			ApprovalDTO list = new ApprovalDTO();
			list = service.draftDetail(idx);
			ArrayList<ApprovalDTO> lineList = service.lineList(idx,employeeID);
			ArrayList<ApprovalDTO> agrRef = service.agrRef(idx,employeeID);
			ArrayList<ApprovalDTO> fileList = service.fileList(idx);
			logger.info("idx:"+idx);
			mav.addObject("lineList",lineList);
			mav.addObject("loginId",loginId);
			mav.addObject("list", list);
			mav.addObject("agrRef",agrRef);
			mav.addObject("fileList",fileList);
			mav.setViewName("approval/draftDetail");
		} else {
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
		}
		return mav;
	}
	

	@RequestMapping(value = "/approval/drawSign")
	@ResponseBody
	public HashMap<String, Object> drawSign(@RequestParam String loginId, String idx) {
		logger.info(loginId+"/"+idx);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ApprovalDTO> signList = service.signList(idx);
		result.put("signList", signList);
		return result;
	}

	@PostMapping(value = "/approval/searchList.do")
	public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr, @RequestParam List<String> keyword) {
		logger.info("keyword : {}", keyword);

		return service.formSearch(session, rAttr, keyword);
	}

	@GetMapping(value = "/approval/writeDraft.go")
	public ModelAndView writeDraftgo(HttpSession session, RedirectAttributes rAttr, @RequestParam int titleID, String date) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		logger.info(date);
		if (dto != null) {
			int employeeID = dto.getEmployeeID();
			logger.info("사번:" + employeeID);
			ApprovalDTO draftInfo = new ApprovalDTO();
			formDTO form = new formDTO();
			draftInfo = service.draftInfo(employeeID);
			form = service.formTitle(titleID);
			mav.addObject("draftInfo", draftInfo);
			mav.addObject("form", form); // 양식정보;
			mav.addObject("date",date); // 양식 클릭한 시간
			mav.setViewName("approval/writeDraftForm");
		} else {
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
		}
		return mav;
	}

//	@GetMapping(value="writeDraft/.do")
//	public ModelAndView writeDraftForm() {
//		
//		ArrayList<ApprovalDTO> list = service.list();
//		mav.addObject("list",list);
//		mav.setViewName("approval/formList");
//		logger.info("list:"+list);
//		return mav;
//	}
	
	@PostMapping(value = "/approval/writeDraft.do", consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> writeDraft(@RequestParam(name = "files", required = false) MultipartFile[] files, HttpSession session,
	        RedirectAttributes rAttr, @RequestParam Map<String, String> param) {
	    Map<String, Object> result = new HashMap<>();
	    LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
	    if (dto != null) {
	        int employeeID = dto.getEmployeeID();
	        param.put("writerID", String.valueOf(employeeID));

	        logger.info("params: {}", param);
	        
	        
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            String lastLineJson = param.get("lastLine");
	            List<Map<String, String>> lastLineList = objectMapper.readValue(lastLineJson, new TypeReference<List<Map<String, String>>>() {});
	            
	            List<LineDTO> lastLineInfoList = new ArrayList<>();

	            for (int i = 0; i < lastLineList.size(); i++) {
	                Map<String, String> item = lastLineList.get(i);
	                String approvalEmp = item.get("employeeID");
	                String order = item.get("order");
	                String category = item.get("category");

	                LineDTO lastLineInfo = new LineDTO();
	                lastLineInfo.setApprovalEmp(approvalEmp);
	                lastLineInfo.setOrder(order);
	                lastLineInfo.setCategory(category);

	                lastLineInfoList.add(lastLineInfo);  
	            }

	            
	                service.write(files, param, lastLineInfoList);
	            
	            
	            formListGo();
	     
	        	} catch (Exception e) {
	        		e.printStackTrace();
				} 
	    		}else {
			        rAttr.addFlashAttribute("msg", "로그인이 필요한 서비스입니다");
			    }
		    
	
		    return result;
	}

	/*
	 * @GetMapping(value="/approval/employeeList")
	 * 
	 * @ResponseBody public HashMap<String,Object> employeeSearch() {
	 * HashMap<String,Object> result = new HashMap<String,Object>();
	 * ArrayList<HashMap<String, Object>> list = service.employeeList();
	 * result.put("list", list); result.put("size", list.size()); return result; }
	 */

	private String formListGo() {
		logger.info("formListGo 호출");
		return "redirect:/approval/formList.go";
	}

	@RequestMapping(value = "/approval/getEmployeeID.do")
	@ResponseBody
	public HashMap<String, Object> getEmployeeID(@RequestParam String employeeID) {
		logger.info("employeeID===========" + employeeID);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<ApprovalDTO> employeeInfo = service.employeeInfo(employeeID);
		result.put("employeeInfo", employeeInfo);
		return result;
	}
	
	// 파일 다운로드
	@GetMapping(value="/approval/download.do")
	public ResponseEntity<Resource> download(String file) throws IOException {
		String path = root+"draft/"+file;
		String ext = file.substring(file.lastIndexOf("."));
		logger.info(path);
		
		// 본문(파일)
		Resource resource = new FileSystemResource(path); // 파일시스템의 특정 파일을 읽어오는 기능
		// 보여주기와 다운로드는 헤더 속성 값의 차이
		HttpHeaders header = new HttpHeaders(); // org.springframework.http.HttpHeaders;
		// text/... : 문자열이라는 뜻, image/... : 이미지라는 뜻, application/octet-stream : 바이너리라는 뜻
		header.add("Content-type", "application/octet-stream");
		// content-Disposition : 내려보낼 내용이 문자(inline)인지 파일(attachment)인지 명시
		// 파일일 경우 파일명이 들어가는데 한글은 다 깨진다.
		// DB 에서 원본 파일명을 가져왔다고 가정하자
		String oriFileName = URLEncoder.encode("원본"+ext, "UTF-8");
		// "attachment;fileName="원본.jpg""
		header.add("content-Disposition", "attachment;fileName=\""+oriFileName+"\"");
		
		return new ResponseEntity<Resource>(resource, header , HttpStatus.OK);
		
	}

	

}
