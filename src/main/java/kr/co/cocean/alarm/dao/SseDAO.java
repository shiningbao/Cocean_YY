package kr.co.cocean.alarm.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.alarm.dto.AlarmDTO;

@Mapper
public interface SseDAO {

	void insertAlarm(AlarmDTO dto);

}
