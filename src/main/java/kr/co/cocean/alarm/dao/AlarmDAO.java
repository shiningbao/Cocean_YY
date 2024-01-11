package kr.co.cocean.alarm.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.alarm.dto.AlarmDTO;

@Mapper
public interface AlarmDAO {

	void insertAlarm(Map<String, Object> alarm);

	ArrayList<AlarmDTO> getList(int employeeID);

	void del(int historyID);

	void allDel(int employeeID);

}
