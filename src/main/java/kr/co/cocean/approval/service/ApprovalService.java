package kr.co.cocean.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

import kr.co.cocean.alarm.service.SseService;
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
	
	public int write(MultipartFile[] files, Map<String, String> param, List<LineDTO> lastLineInfoList) {
		ApprovalDTO dto = new ApprovalDTO();
		int writerID = Integer.parseInt(param.get("writerID"));
		int publicStatus = Integer.parseInt(param.get("publicStatus"));
		int tempSave = Integer.parseInt(param.get("tempSave"));
		String title = param.get("title");
		String titleID = param.get("titleID");
		String lastOrder = param.get("lastOrder");
		logger.info(title);
		dto.setEmployeeID(writerID);
		dto.setPublicStatus(publicStatus);
		dto.setTempSave(tempSave);
		dto.setDocumentNo(title);
		dto.setTitleID(titleID);
		dto.setStartDate(param.get("startDate"));
		dto.setEndDate(param.get("endDate"));
		dto.setTextArea(param.get("textArea"));
		dto.setVacationCategory(param.get("vacationCategory"));
		if(param.get("total")!=null&&!param.get("total").isEmpty()) {
		dto.setUsageTime(Double.parseDouble(param.get("total")));
		}
		
		logger.info("params:{}",param);

		dao.write(dto); // draft테이블에 insert
		int idx=dto.getIdx();
		
		if(files!=null) {
		for (MultipartFile file : files) {
			upload(file,idx);
		}}
		String content = param.get("content");
		if(titleID.equals("1")) {
		dao.writeWorkDraft(title,content,idx); // workDraft테이블에 insert
		}else if(titleID.equals("2")) {
			logger.info(param.get("textArea"));
			dao.writeattendenceDraft(dto); // 휴가신청서 insert
		}else if(titleID.equals("3")){
			logger.info("휴직원");
			dao.writeLeaveDraft(dto); // 휴직원 insert
		}else {
			dao.writeReincrement(dto); // 복직원 insert
		}
		if(tempSave==0) {
			dao.approvalWrite(lastLineInfoList,idx,lastOrder); // approval테이블에 insert
			if(param.get("publicStatus").equals("1")) {
				dao.publicApp(idx); // "공개"일때 approval 테이블 insert
			}
		}else { // 첫 임시저장
			
				if(lastLineInfoList.isEmpty()) { // 결재라인 비었을 경우
					dao.lineEmptyTs(idx,lastOrder,writerID); // approval테이블에 insert
				}else{
				dao.approvalTs(lastLineInfoList,idx,lastOrder); // approval테이블에 insert
				}
		}
		 for (LineDTO lineInfo : lastLineInfoList) { // 알람관련
	            String category = lineInfo.getCategory();
	            String employeeID = lineInfo.getApprovalEmp();
	            dto = dao.getForm(idx);
	            String form = dto.getFormTitle();
	            SseService sseService = new SseService(); 
	           // sseService.alarm(category,Integer.parseInt(employeeID), idx, form);
	        }
		 return idx;
		
	}
	
	
	public void update(MultipartFile[] files, Map<String, String> param, List<LineDTO> lastLineInfoList) {
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		int idx=Integer.parseInt(param.get("idx"));
		dao.updateDraft(param,formatedNow);
			if(files!=null) {
				int confirm = dao.cfFile(param);
				if(confirm>0) {
				for (MultipartFile file : files) {
					String oriFileName = file.getOriginalFilename();
					String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
					String newFileName = System.currentTimeMillis()+ext;	
					
					try {
						byte[] bytes;
						bytes = file.getBytes();
						Path path = Paths.get(root+"draft/"+newFileName);
						Files.write(path, bytes);
						dao.updateFile(idx,oriFileName,newFileName);
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
			}
		}

		if(lastLineInfoList.isEmpty()) {
			dao.updateLineEmpty(param);
		}else {
			dao.updateApproval(lastLineInfoList,param);
		}
		if(param.get("titleID").equals("1")) {
			dao.updateWorkDraft(param);
			}else if(param.get("titleID").equals("2")) {
				dao.updateAttendenceDraft(param);
			}else if(param.get("titleID").equals("3")){
				dao.updateLeaveDraft(param);
			}else {
				dao.updateReincrement(param);
			}
		
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
			dao.writeFile(idx,oriFileName,newFileName); // file테이블에 insert
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

	public ArrayList<ApprovalDTO> lineList(int idx) {
		return dao.lineList(idx);
	}

	public ArrayList<ApprovalDTO> signList(String idx, String loginId) {
		
		return dao.signList(idx);
	}

	public ArrayList<ApprovalDTO> agrRef(int idx) {
		return dao.agrRef(idx);
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

	public ApprovalDTO getOrder(String idx, String loginId) {
		return dao.getOrder(idx, loginId);
	}

	public void myApprove(Map<String, String> param) {
		dao.myApprove(param);
		
	}

	
	public void passApp(String idx, int approvalOrder) {
		dao.passApp(idx,approvalOrder);
	}

	public ArrayList<ApprovalDTO> saveList(int employeeID) {
		return dao.saveList(employeeID);
	}

	public Object tempSaveForm(int idx, String employeeID) {
		return dao.draftDetail(idx);
	}

	public ApprovalDTO vacDetail(int idx) {
		return dao.vacDetail(idx);
	}

	public ApprovalDTO lvDetail(int idx) {
		return dao.lvDetail(idx);
	}

	public ArrayList<ApprovalDTO> myList(int employeeID) {
		return dao.myList(employeeID);
	}

	public ArrayList<ApprovalDTO> refList(int employeeID) {
		return dao.refList(employeeID);
	}

	public ArrayList<ApprovalDTO> comList(int employeeID) {
		return dao.comList(employeeID);
	}

	public ArrayList<ApprovalDTO> departmentList(int employeeID) {
		return dao.departmentList(employeeID);
	}

	public ApprovalDTO getSign(int idx, int employeeID) {
		return dao.getSign(idx,employeeID);
	}

	public void passDraft(String idx) {
		dao.passDraft(idx);
		
	}

	public void myStatus(Map<String, String> param) {
		dao.myStatus(param);
		
	}

	public void myAgree(Map<String, String> param) {
		dao.myAgree(param);
		
	}

	public void rejectAgree(Map<String, String> param) {
		dao.rejectAgree(param);
		
	}

	public void updateRAL(double updateRAL, Map<String, String> param) {
		dao.updateRAL(updateRAL,param);
	}

	

	/*
	 * public ArrayList<HashMap<String, Object>> employeeList() { return
	 * dao.employeeList(); }
	 */

}
