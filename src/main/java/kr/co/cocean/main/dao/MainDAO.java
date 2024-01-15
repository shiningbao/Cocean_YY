package kr.co.cocean.main.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.board.dto.BoardDTO;

@Mapper
public interface MainDAO {

	ArrayList<BoardDTO> getNoticeList();

	
}
