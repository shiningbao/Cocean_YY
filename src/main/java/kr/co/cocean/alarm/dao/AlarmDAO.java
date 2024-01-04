package kr.co.cocean.alarm.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.alarm.dto.AlarmDTO;

@Mapper
public interface AlarmDAO {
	
	void insertAlarm(AlarmDTO dto);

	ArrayList<AlarmDTO> getList(int employeeID);
	
}
