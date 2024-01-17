package kr.co.cocean.schedule.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.schedule.dao.ScheduleDAO;
import kr.co.cocean.schedule.dto.ScheduleDTO;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public List<ScheduleDTO> getCallender(String loginEmployeeID) {
		logger.info("나의 캘린더 가져오기 서비스 접근");
		return dao.getCallender(loginEmployeeID);
	}
	public void scheduleWrite(ScheduleDTO dto) {
		dao.scheduleWrite(dto);
	}
	public List<HashMap<String, Object>> getCallenderEvents(int employeeID) {

		return dao.getCallenderEvents(employeeID);
	}
	public List<String> getFacility(String text) {


		return dao.getFacility(text);
	}
	public void facilityWrite(ScheduleDTO dto) {
		String facilityName = dto.getTitle();
		dto.getStart();
		dto.getEnd();
		int row =dao.facilityWrite(dto);
		if(row>0) {
//			dao.updateFacility(facilityName);
		}

	}
	public List<HashMap<String, Object>> getFacilityEvents() {
		return dao.getFacilityEvents();
	}
	public List<HashMap<String, Object>> addInterestCallender(String loginEmployeeID) {
		return dao.addInterestCallender(loginEmployeeID);
	}
	public int addCalender(String loginEmployeeID, String nodeName, String employeeID) {
		return dao.addCalender(loginEmployeeID,nodeName,employeeID);
	}
	/*
	 * public List<String> showInterestCalendar(String loginEmployeeID) { return
	 * dao.showInterestCalendar(loginEmployeeID); }
	 */
	public List<HashMap<String, Object>> getAddCalList(String val, String backgroundColor) {
		List<HashMap<String, Object>> result = dao.getAddCalList(val);
		for (HashMap<String, Object> hashMap : result) {
			hashMap.put("backgroundColor", backgroundColor);
		}
		return result;
	}
	public String getDetailWriteName(String id) {
		// TODO Auto-generated method stub
		return dao.getDetailWriteName(id);
	}
	public int delMyCal(String id) {
		return dao.delMyCal(id);
	}
	public void interestDelCalendar(String calendarID) {

		dao.interestDelCalendar(calendarID);
	}

	public void updateCal(HashMap<String, Object> dataToSend) {
		dao.updateCal(dataToSend);
	}

	public List<HashMap<String, Object>> scheduleAlarm() {
		return dao.scheduleAlarm();
	}
	public void addalarm(List<HashMap<String, Object>> result) {

		dao.addalarm(result);

	}


}
