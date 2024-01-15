package kr.co.cocean.main.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.main.dao.MainDAO;

@Service
public class MainService {
	
	@Autowired MainDAO dao;

	public ArrayList<BoardDTO> getNoticeList() {
		return dao.getNoticeList();
	}

}
