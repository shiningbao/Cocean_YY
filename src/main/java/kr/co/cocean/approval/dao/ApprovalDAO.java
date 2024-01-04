package kr.co.cocean.approval.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.approval.dto.LineDTO;
import kr.co.cocean.approval.dto.formDTO;
@Mapper
public interface ApprovalDAO {

	ArrayList<formDTO> list();

	ArrayList<ApprovalDTO> formSearch(List<String> keyword);

	ApprovalDTO draftInfo(int employeeID);

	void write(ApprovalDTO dto);

	void writeWorkDraft(String title,String content, int idx);

	void writeFile(int idx, String oriFileName, String newFileName);

	ArrayList<ApprovalDTO> employeeInfo(String employeeID);

	ArrayList<ApprovalDTO> waitingList(int employeeID);

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

	ArrayList<ApprovalDTO> saveList(int employeeID);

	ApprovalDTO vacDetail(int idx);

	ApprovalDTO lvDetail(int idx);

	ArrayList<ApprovalDTO> myList(int employeeID);

	ArrayList<ApprovalDTO> refList(int employeeID);

	ArrayList<ApprovalDTO> comList(int employeeID);

	ArrayList<ApprovalDTO> departmentList(int employeeID);

	ApprovalDTO getSign(int idx, int employeeID);

	void passDraft(String idx);

	void myStatus(Map<String, String> param);

	void myAgree(Map<String, String> param);

	void rejectAgree(Map<String, String> param);

	void publicApp(int idx);

	ApprovalDTO getForm(int idx);

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
