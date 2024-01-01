package kr.co.cocean.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Mapper
public interface WorkDAO {
	//리스트 
	ArrayList<OutAddressDTO> work();

	

	
}
