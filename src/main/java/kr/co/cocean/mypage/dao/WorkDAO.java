package kr.co.cocean.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.cocean.mypage.dto.WorkDTO;

@Mapper
public interface WorkDAO {




	ArrayList<WorkDTO> worklist(String pfirstSearchDate, String plastSearchDate, int userId);

	//출근
	/*
	List<WorkDTO> gocheck(String timedataValue, String datedataValue, int userId);
	*/
	int gocheck(@Param("timedataValue") String timedataValue, @Param("datedataValue") String datedataValue, @Param("userId") int userId);

	//퇴근
	int leavecheck(String timedataValue, String datedataValue, int userId);

	/*
	//페이지 처리
	ArrayList<WorkDTO> worklist(String pfirstSearchDate, String plastSearchDate, int userId, Pager pager);
	//페이징 처리
	Integer totalCount(HashMap<String, Object> params);
*/








}
