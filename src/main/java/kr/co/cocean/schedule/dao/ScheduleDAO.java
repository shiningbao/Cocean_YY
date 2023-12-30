package kr.co.cocean.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.schedule.dto.ScheduleDTO;

@Mapper
public interface ScheduleDAO {


	List<ScheduleDTO> getCallender(String loginEmployeeID);

	void scheduleWrite(ScheduleDTO dto);

	List<HashMap<String, Object>> getCallenderEvents(int employeeID);

	List<String> getFacility(String text);

	int facilityWrite(ScheduleDTO dto);

	void updateFacility(String facilityName);

	List<HashMap<String, Object>> getFacilityEvents();

	List<HashMap<String, Object>> addInterestCallender(String loginEmployeeID);

	int addCalender(String loginEmployeeID, String nodeName, String employeeID);

	List<HashMap<String, Object>> getAddCalList(String val);

	String getDetailWriteName(String id);

	int delMyCal(String id);

	void interestDelCalendar(String calendarID);

	void updateCal(HashMap<String, Object> dataToSend);


	/* List<String> showInterestCalendar(String loginEmployeeID); */

}
