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

	public ArrayList<BoardDTO> boardList(String category, int perPage, Integer pageNum, String searchCategory, String search) {
		Integer offset = (pageNum -1) * perPage;
		return dao.boardList(category,perPage,offset,searchCategory,search);
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

	public int getTotalCount(String category,int perPage, String searchCategory, String search) {
		int count = dao.getTotalCount(category,searchCategory,search);
		int totalCount = (int) Math.ceil((double) count / perPage);
		logger.info("totalCount: {}",totalCount);
		return totalCount;
	}

	public void commentDel(int commentID) {
		dao.commentDel(commentID);
	}

	public void commentHidden(int commentID) {
		dao.commentHidden(commentID);
	}


	public HashMap<String, Object> commentUpdateGo(int commentID, String content) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("result", dao.commentUpdateGo(commentID, content));
		
		return result;
	}

	public int boardDel(int employeeID, int boardID) {
		return dao.boardDel(employeeID,boardID);
	}

	public int boardHidden(int boardID) {
		return dao.boardHidden(boardID);
	}

	public ModelAndView boardUpdateGo(int boardID, String bt) {
		ModelAndView mav = new ModelAndView("board/boardUpdate");
		
		mav.addObject("bt", bt);
		mav.addObject("detail", dao.boardDetail(boardID));
		return mav;
	}
	

}
