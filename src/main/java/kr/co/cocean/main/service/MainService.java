package kr.co.cocean.main.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.approval.dto.ApprovalDTO;
import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.main.dao.MainDAO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Service
public class MainService {
	
	@Autowired MainDAO dao;

	public ArrayList<BoardDTO> getNoticeList() {
		return dao.getNoticeList();
	}

	public ArrayList<ApprovalDTO> homeWaitingList(int employeeID) {
		return dao.homeWaitingList(employeeID);
	}


}
