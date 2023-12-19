package kr.co.cocean.schedule.dto;

import org.apache.ibatis.type.Alias;

@Alias("schedule")
public class ScheduleDTO {
	
	private String departmentName;

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	
}
