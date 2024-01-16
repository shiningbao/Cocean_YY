package kr.co.cocean.approval.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.cocean.alarm.service.SseService;
import kr.co.cocean.approval.dao.ApprovalDAO;
import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.dto.LineDTO;
import kr.co.cocean.approval.dto.formDTO;
import kr.co.cocean.tank.dto.Pager;

@Service
public class ApprovalService {

	private String root = "C:/upload/cocean/";

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired ApprovalDAO dao;

	public ArrayList<formDTO> list() {
		return dao.list();
	}

	/*
	 * public ModelAndView formSearch(HttpSession session, RedirectAttributes rAttr,
	 * List<String> keyword) { ModelAndView mav = new ModelAndView(); LoginDTO dto =
	 * (LoginDTO) session.getAttribute("userInfo");
	 *
	 * if(dto!=null) { ArrayList<ApprovalDTO> list = dao.formSearch(keyword);
	 * mav.addObject("list",list); mav.setViewName("approval/formList"); }else{
	 * mav.setViewName("redirect:/");
	 * rAttr.addFlashAttribute("msg","로그인이 필요한 서비스입니다"); } return mav; }
	 */

	public ApprovalDTO draftInfo(int employeeID) {
		return dao.draftInfo(employeeID);
	}

	public void write(MultipartFile[] files, Map<String, String> param, List<LineDTO> lastLineInfoList) {
		ApprovalDTO dto = new ApprovalDTO();
		int writerID = Integer.parseInt(param.get("writerID"));
		int publicStatus = Integer.parseInt(param.get("publicStatus"));
		int tempSave = Integer.parseInt(param.get("tempSave"));
		String title = param.get("title");
		String titleID = param.get("titleID");
		String lastOrder = null;
		if(param.get("lastOrder").equals("undefined")) {
			lastOrder="0";
		}else {
			lastOrder=param.get("lastOrder");
		}
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
			/*
			 * List<LineDTO> agreementLines = new ArrayList<>(); String category = null; for
			 * (LineDTO lineDTO : lastLineInfoList) { category = lineDTO.getCategory();
			 * if(category.equals("합의")) { agreementLines.add(lineDTO); } } if
			 * (!agreementLines.isEmpty()) { LineDTO minOrderLine =
			 * Collections.min(agreementLines, Comparator.comparing(LineDTO::getOrder)); int
			 * minOrder = Integer.parseInt(minOrderLine.getOrder());
			 *
			 * for (LineDTO lineDTO : agreementLines) {
			 * lineDTO.setOrder(String.valueOf(minOrder)); if
			 * ("결재".equals(lineDTO.getCategory())) {
			 *
			 * break;
			 *
			 * } }
			 *
			 * }
			 */
			dao.approvalWrite(lastLineInfoList,idx,lastOrder); // approval테이블에 insert
			List<ApprovalDTO> waitingEmp = dao.getWaitingEmp(idx);
			logger.info("결재대기:"+waitingEmp);
			
			/*
			 * dao.draftAlarm("/approval/draftDetail.go?idx="+idx+
			 * "&employeeID=180001&category=결재&hTitle=waiting",idx); SseService sse = new
			 * SseService();
			 */
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
		/*
		 * for (LineDTO lineInfo : lastLineInfoList) { // 알람관련 String category =
		 * lineInfo.getCategory(); String employeeID = lineInfo.getApprovalEmp(); dto =
		 * dao.getForm(idx); String form = dto.getFormTitle(); SseService sseService =
		 * new SseService(); sseService.alarm(category,Integer.parseInt(employeeID),
		 * idx, form); }
		 */
		/*
		 * for (LineDTO lineInfo : lastLineInfoList) { lineInfo.getCategory(); String
		 * employeeID = lineInfo.getApprovalEmp(); dto = dao.getForm(idx); String form =
		 * dto.getFormTitle(); }
		 */
		
		/*
		 employeeID = 알람받을 직원
		 content = 표시할 알람 내용 ex) 일정 30분 전입니다. / 결재가 도착했습니다
		 url = 알람 클릭하면 이동할 주소 ex) /schedule/schedule.go
		 */
		// dao.alarmInsert(employeeID, content, url)
		//SseService sse = new SseService();
		//sse.alarm(employeeID, content, url)
		
		

	}


	public void update(MultipartFile[] files, Map<String, String> param, List<LineDTO> lastLineInfoList) throws Exception {
		ApprovalDTO dto = new ApprovalDTO();
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		int idx=Integer.parseInt(param.get("idx"));
		int writerID = Integer.parseInt(param.get("writerID"));
		int publicStatus = Integer.parseInt(param.get("publicStatus"));
		int tempSave = Integer.parseInt(param.get("tempSave"));
		String title = param.get("title");
		String titleID = param.get("titleID");
		String lastOrder = null;
		String content = param.get("content");
		if(param.get("lastOrder").equals("undefined")) {
			lastOrder="0";
		}else {
			lastOrder=param.get("lastOrder");
		}
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
		
		dao.deleteApprovalLines(idx,titleID);
		dao.updateDraft(param, formatedNow);
		 
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
			if(tempSave==1) {
	        // 새로운 결재 라인 정보 추가
	        dao.approvalSave(lastLineInfoList,idx,lastOrder);
			}else {
				dao.approvalWrite(lastLineInfoList, idx, lastOrder);
			}
	    }

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

	public ArrayList<ApprovalDTO> waitingList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.totalCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());

		return dao.waitingList(params);
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

	public ArrayList<ApprovalDTO> saveList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.sCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());

		return dao.saveList(params);
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

	public ArrayList<ApprovalDTO> myList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.mDcount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());

		return dao.myList(params);
	}

	public ArrayList<ApprovalDTO> refList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.RCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());

		return dao.refList(params);
	}

	public ArrayList<ApprovalDTO> comList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.MaCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());
		return dao.comList(params);
	}

	public ArrayList<ApprovalDTO> departmentList(int employeeID, Pager pager) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("pageNum", (pager.getPageNum()-1)*10);
		params.put("search", pager.getSearch());
		params.put("employeeID", employeeID);
		Integer total = dao.dpCount(params);
		if(total == 0) {
			pager.setTotalCount(1);
		}else {
			pager.setTotalCount(total);
		}
		logger.info("params:{}",params);
		logger.info("totalCount: "+pager.getTotalCount());

		return dao.departmentList(params);
	}

	public ArrayList<ApprovalDTO> profile(int employeeId) {
		return dao.profile(employeeId);
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

	public ArrayList<ApprovalDTO> waitingSearch(String keyword, int employeeID) {
		return dao.waitingSearch(keyword,employeeID);
	}

	public ArrayList<formDTO> formSearch(String keyword) {
		return dao.formSearch(keyword);
	}

	public ArrayList<ApprovalDTO> dpSearch(String keyword, int employeeID) {
		return dao.dpSearch(keyword,employeeID);
	}

	public ArrayList<ApprovalDTO> mySearch(String keyword, int employeeID) {
		return dao.mySearch(keyword,employeeID);
	}

	public ArrayList<ApprovalDTO> refSearch(String keyword, int employeeID) {
		return dao.refSearch(keyword,employeeID);
	}

	public ArrayList<ApprovalDTO> myAppSearch(String keyword, int employeeID) {
		return dao.myAppSearch(keyword,employeeID);
	}


	public int removeList(String idx, String titleID) {
		int cnt = 0;
		cnt = dao.removeList(idx,titleID);
		return cnt;

	}

	public ApprovalDTO getPhoto(int loginId) {
		return dao.getPhoto(loginId);
	}

	public ApprovalDTO getSign(int empID) {
		return dao.getSign(empID);
	}

	public ArrayList<ApprovalDTO> signImg(int idx) {
		return dao.signImg(idx);
	}


	/*
	 * public ArrayList<HashMap<String, Object>> employeeList() { return
	 * dao.employeeList(); }
	 */

}
