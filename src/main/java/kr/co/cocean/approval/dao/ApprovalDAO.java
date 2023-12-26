package kr.co.cocean.approval.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
@Mapper
public interface ApprovalDAO {

	ArrayList<ApprovalDTO> list();

	ArrayList<ApprovalDTO> formSearch(List<String> keyword);

	ArrayList<ApprovalDTO> draftInfo(int employeeID);

	void write(ApprovalDTO dto);

	void writeWorkDraft(String title,String content, int idx);

	void writeFile(int idx, String oriFileName, String newFileName);

	ArrayList<ApprovalDTO> employeeInfo(String employeeID);

	ArrayList<ApprovalDTO> waitingList(int employeeID);

	ArrayList<ApprovalDTO> draftDetail(int idx, int employeeID);

	void saveApprovalLine(int employeeID, String category);



}
