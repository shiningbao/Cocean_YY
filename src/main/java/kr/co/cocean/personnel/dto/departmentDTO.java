package kr.co.cocean.personnel.dto;



import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
@Alias("department")
public class departmentDTO {
	private String departmentID;
	private String departmentName;
	private String hqID;
	private Boolean isActive;
	
	public String getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}
		
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getHqID() {
		return hqID;
	}
	public void setHqID(String hqID) {
		this.hqID = hqID;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	
	
	
	
	
}
