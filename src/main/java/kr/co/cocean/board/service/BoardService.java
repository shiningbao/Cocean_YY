package kr.co.cocean.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.board.dao.BoardDAO;
import kr.co.cocean.board.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired BoardDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<BoardDTO> boardList(String category) {
		return dao.boardList(category);
	}

	public ArrayList<BoardDTO> boardList_pin(String category) {
		return dao.boardList_pin(category);
	}

	public void boardWrite(BoardDTO param) {
		dao.boardWrite(param);
		
	}

	public ModelAndView boardDetail(int boardID, String category, String bt) {
		ModelAndView mav = new ModelAndView("board/boardDetail");
		
		mav.addObject("bt", bt);
		mav.addObject("detail", dao.boardDetail(boardID));
		mav.addObject("prevNext", dao.prevNext(boardID,category));
		return mav;
	}
	
	
	
}
