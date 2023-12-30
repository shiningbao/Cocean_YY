package kr.co.cocean.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.dto.LineDTO;
import kr.co.cocean.approval.dto.formDTO;
import kr.co.cocean.mypage.dto.LoginDTO;

@Service
public class ApprovalService {
	
	private String root = "C:/upload/cocean/";
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO dao;

	public ArrayList<formDTO> list() {
		
		return dao.list();
	}

	public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr, List<String> keyword) {
		ModelAndView mav = new ModelAndView();
		LoginDTO dto = (LoginDTO) session.getAttribute("userInfo");
		
		if(dto!=null) {
			ArrayList<ApprovalDTO> list = dao.formSearch(keyword);
			mav.addObject("list",list);
			mav.setViewName("approval/formList");
		}else{
			mav.setViewName("redirect:/");
			rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다");
		}
		return mav;
	}

	public ApprovalDTO draftInfo(int employeeID) {
		return dao.draftInfo(employeeID);
	}
	
	
	ApprovalDTO dto = new ApprovalDTO();
	public void write(MultipartFile[] files, Map<String, String> param, List<LineDTO> lastLineInfoList) {
		int employeeID = Integer.parseInt(param.get("writerID"));
		int publicStatus = Integer.parseInt(param.get("publicStatus"));
		int tempSave = Integer.parseInt(param.get("tempSave"));
		String title = param.get("title");
		String titleID = param.get("titleID");
		String lastOrder = param.get("lastOrder");
		logger.info(title);
		dto.setEmployeeID(employeeID);
		dto.setPublicStatus(publicStatus);
		dto.setTempSave(tempSave);
		dto.setDocumentNo(title);
		dto.setTitleID(titleID);
		
		logger.info("params:{}",param);
		
		// dao.write(dto); // draft테이블에 insert
		int idx=dto.getIdx();
		
		if(files!=null) {
		for (MultipartFile file : files) {
			upload(file,idx);
		}}
		String content = param.get("content");
	

		dao.writeWorkDraft(title,content,idx); // workDraft테이블에 insert
		dao.approvalWrite(lastLineInfoList,idx,lastOrder); // approval테이블에 insert
		
		// dao.writeAttendanceDraftContent(param);
		
	}
	// file 테이블에 insert 
	public void upload(MultipartFile uploadFile, int idx) {
		
		String oriFileName = uploadFile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get(root+"draft/"+newFileName);
			Files.write(path, bytes);
			// dao.writeFile(idx,oriFileName,newFileName); // file테이블에 insert
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ApprovalDTO> employeeInfo(String employeeID) {
		return dao.employeeInfo(employeeID);
		
	}

	public ArrayList<ApprovalDTO> waitingList(int employeeID) {
		return dao.waitingList(employeeID);
	}

	public ApprovalDTO draftDetail(int idx) {
		return dao.draftDetail(idx);
	}


	public void saveApprovalLine(int employeeID, String category) {
		dao.saveApprovalLine(employeeID,category);
		
	}

	public formDTO formTitle(int titleID) {
		return dao.formTitle(titleID);
	}

	public ArrayList<ApprovalDTO> lineList(int idx,int employeeID) {
		return dao.lineList(idx,employeeID);
	}

	public ArrayList<ApprovalDTO> signList(String idx) {
		return dao.signList(idx);
	}

	public ArrayList<ApprovalDTO> agrRef(int idx, int employeeID) {
		return dao.agrRef(idx,employeeID);
	}
	
	public ArrayList<ApprovalDTO> fileList(int idx) {
		return dao.fileList(idx);
	}

	public void approval(Map<String, String> param) {
		dao.approval(param);
	}

	public void rejectDraft(Map<String, String> param) {
		dao.rejectDraft(param);
		
	}

	public void rejectApp(Map<String, String> param) {
		dao.rejectApp(param);
		
	}

	public void approveDraft(Map<String, String> param) {
		dao.approveDraft(param);
		
	}

	public void approveApp(Map<String, String> param) {
		dao.approveApp(param);
		
	}


	/*
	 * public ArrayList<HashMap<String, Object>> employeeList() { return
	 * dao.employeeList(); }
	 */

}
