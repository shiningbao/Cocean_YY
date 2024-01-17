package kr.co.cocean.main.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Mapper
public interface MainDAO {

	ArrayList<BoardDTO> getNoticeList();

	ArrayList<ApprovalDTO> homeWaitingList(int employeeID);

	
}
