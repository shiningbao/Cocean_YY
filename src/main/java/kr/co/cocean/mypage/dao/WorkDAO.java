package kr.co.cocean.mypage.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Mapper
public interface WorkDAO {




	ArrayList<WorkDTO> worklist(String pfirstSearchDate, String plastSearchDate, int userId);

	//출근
	String gowork(int userId, Timestamp gotime);

	
	

	
}
