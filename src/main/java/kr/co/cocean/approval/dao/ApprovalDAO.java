package kr.co.cocean.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	ArrayList<ApprovalDTO> lineList(int idx, int EmployeeID);

	ArrayList<ApprovalDTO> signList(String idx);

	ArrayList<ApprovalDTO> agrRef(int idx, int employeeID);

	ArrayList<ApprovalDTO> fileList(int idx);

	void approval(Map<String, String> param);

	void rejectDraft(Map<String, String> param);

	void rejectApp(Map<String, String> param);

	void approveDraft(Map<String, String> param);

	void approveApp(Map<String, String> param);



}
