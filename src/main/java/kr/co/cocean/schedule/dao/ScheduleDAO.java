package kr.co.cocean.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.schedule.dto.ScheduleDTO;

@Mapper
public interface ScheduleDAO {

	List<ScheduleDTO> getTeams();

}
