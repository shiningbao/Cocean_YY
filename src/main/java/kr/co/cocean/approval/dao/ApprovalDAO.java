package kr.co.cocean.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.dto.LineDTO;
import kr.co.cocean.approval.dto.formDTO;
import kr.co.cocean.tank.dto.Pager;
@Mapper
public interface ApprovalDAO {

	ArrayList<formDTO> list();

	ArrayList<ApprovalDTO> formSearch(List<String> keyword);

	ApprovalDTO draftInfo(int employeeID);

	void write(ApprovalDTO dto);

	void writeWorkDraft(String title,String content, int idx);

	void writeFile(int idx, String oriFileName, String newFileName);

	ArrayList<ApprovalDTO> employeeInfo(String employeeID);

	ArrayList<ApprovalDTO> waitingList(int employeeID, Pager pager);

	ApprovalDTO draftDetail(int idx);

	void saveApprovalLine(int employeeID, String category);

	void approvalWrite(List<LineDTO> lastLineInfoList, int idx, String lastOrder);

	formDTO formTitle(int titleID);

	ArrayList<ApprovalDTO> lineList(int idx);

	ArrayList<ApprovalDTO> signList(String idx);

	ArrayList<ApprovalDTO> agrRef(int idx);

	ArrayList<ApprovalDTO> fileList(int idx);

	void approval(Map<String, String> param);

	void rejectDraft(Map<String, String> param);

	void rejectApp(Map<String, String> param);

	void approveDraft(Map<String, String> param);

	void approveApp(Map<String, String> param);

	ApprovalDTO getOrder(String idx, String loginId);

	void passApp(String idx, int approvalOrder);

	void myApprove(Map<String, String> param);

	void approvalTs(List<LineDTO> lastLineInfoList, int idx, String lastOrder);

	void lineEmptyTs(int idx, String lastOrder,int employeeID);

	void writeLeaveDraft(ApprovalDTO dto);

	void writeReincrement(ApprovalDTO dto);

	void writeattendenceDraft(ApprovalDTO dto);

	ArrayList<ApprovalDTO> saveList(HashMap<String, Object> params);

	ApprovalDTO vacDetail(int idx);

	ApprovalDTO lvDetail(int idx);

	ArrayList<ApprovalDTO> myList(HashMap<String, Object> params);

	ArrayList<ApprovalDTO> refList(HashMap<String, Object> params);

	ArrayList<ApprovalDTO> comList(HashMap<String, Object> params);

	ArrayList<ApprovalDTO> departmentList(HashMap<String, Object> params);

	void passDraft(String idx);

	void myStatus(Map<String, String> param);

	void myAgree(Map<String, String> param);

	void rejectAgree(Map<String, String> param);

	void publicApp(int idx);

	ApprovalDTO getForm(int idx);

	void updateRAL(double updateRAL, Map<String, String> param);

	void updateDraft(Map<String, String> param, String formatedNow);

	void updateLineEmpty(Map<String, String> param);

	void updateWorkDraft(Map<String, String> param);

	void updateAttendenceDraft(Map<String, String> param);

	void updateLeaveDraft(Map<String, String> param);

	void updateReincrement(Map<String, String> param);

	int cfFile(Map<String, String> param);

	void updateFile(int idx, String oriFileName, String newFileName);

	ArrayList<ApprovalDTO> waitingSearch(String keyword, int employeeID);

	ArrayList<formDTO> formSearch(String keyword);

	ArrayList<ApprovalDTO> dpSearch(String keyword, int employeeID);

	ArrayList<ApprovalDTO> mySearch(String keyword, int employeeID);

	ArrayList<ApprovalDTO> refSearch(String keyword, int employeeID);

	ArrayList<ApprovalDTO> myAppSearch(String keyword, int employeeID);

	Integer totalCount(HashMap<String, Object> params);

	ArrayList<ApprovalDTO> waitingList(HashMap<String, Object> params);

	Integer RCount(HashMap<String, Object> params);

	Integer MaCount(HashMap<String, Object> params);

	Integer mDcount(HashMap<String, Object> params);

	Integer dpCount(HashMap<String, Object> params);

	Integer sCount(HashMap<String, Object> params);

	int removeList(String idx, String titleID);

	ArrayList<LineDTO> checkEmpId(int idx);

	ArrayList<ApprovalDTO> profile(int employeeId);

	ApprovalDTO getPhoto(int loginId);

	ApprovalDTO getSign(int empID);

	ArrayList<ApprovalDTO> signImg(int idx);

	ApprovalDTO getWaitingEmp(int idx);

	void draftAlarm(List<ApprovalDTO> waitingEmp, int idx);

	void insertApproval(List<LineDTO> saveLine, Map<String, String> param, List<LineDTO> lastLineInfoList);

	void updateApproval(List<LineDTO> lastLineInfoList, List<LineDTO> check, Map<String, String> param);

	void deleteApprovalLines(int idx, String titleID);

	void insertApprovalLines(int idx, List<LineDTO> lastLineInfoList);

	void approvalSave(List<LineDTO> lastLineInfoList, int idx, String lastOrder);
	
	void alarmInsert(int employeeID, String content, String url);

	void changeCategory(Map<String, String> param);

	ArrayList<ApprovalDTO> hidden(int employeeID);

	void refDate(Map<String, String> param);


	/*
	 * void update(ApprovalDTO dto);
	 *
	 * void updateWd(String title, String content, int idx);
	 *
	 * void updateAd(ApprovalDTO dto);
	 *
	 * void updateLd(ApprovalDTO dto);
	 *
	 * void updateRd(ApprovalDTO dto);
	 */





}
