package kr.co.cocean.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.cocean.board.dto.BoardDTO;

@Mapper
public interface BoardDAO {

	ArrayList<BoardDTO> boardList(@Param("category") String category
			,@Param("perPage") int perPage, @Param("offset")Integer offset
			,@Param("searchCategory")String searchCategory,@Param("search") String search);

	ArrayList<BoardDTO> boardList_pin(String category);

	void boardWrite(BoardDTO param);

	BoardDTO boardDetail(int boardID);

	HashMap<String, String> prevNext(int boardID, String category);

	ArrayList<BoardDTO> commentList(int boardID);

	void commentWrite(BoardDTO param);

	BoardDTO commentDetail(int commentID);

	int getTotalCount(@Param("category") String category, @Param("searchCategory")String searchCategory,@Param("search") String search);

	void commentDel(int commentID);

	void commentHidden(int commentID);

	int commentUpdateGo(int commentID, String content);

	int boardDel(int employeeID, int boardID);

	int boardHidden(int boardID);

}
