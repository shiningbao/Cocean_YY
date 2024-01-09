package kr.co.cocean.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cocean.board.dao.BoardDAO;
import kr.co.cocean.board.dto.BoardDTO;
import kr.co.cocean.tank.dto.Pager;

@Service
public class BoardService {
	
	@Autowired BoardDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<BoardDTO> boardList(String category, int perPage, Integer pageNum) {
		Integer offset = (pageNum -1) * perPage;
		return dao.boardList(category,perPage,offset);
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
		mav.addObject("commentList", dao.commentList(boardID));
		return mav;
	}

	public BoardDTO commentWrite(BoardDTO param) {
		BoardDTO dto = null;
		dao.commentWrite(param);
		if(param.getCommentID() != 0) {
			logger.info(""+param.getCommentID());
			dto = dao.commentDetail(param.getCommentID());
		}
		
		return dto;
	}

	public int getTotalCount(String category,int perPage) {
		int count = dao.getTotalCount(category);
		int totalCount = (int) Math.ceil((double) count / perPage);
		logger.info("totalCount: {}",totalCount);
		return totalCount;
	}
	
	
	
}
