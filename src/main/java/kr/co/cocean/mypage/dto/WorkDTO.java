package kr.co.cocean.mypage.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("work")
public class WorkDTO {

	private int workID;
	private int employeeID;
	private Date workDate;
	private DateTimeFormat gowork;
	private DateTimeFormat leavework;
	
	public int getWorkID() {
		return workID;
	}
	public void setWorkID(int workID) {
		this.workID = workID;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public DateTimeFormat getGowork() {
		return gowork;
	}
	public void setGowork(DateTimeFormat gowork) {
		this.gowork = gowork;
	}
	public DateTimeFormat getLeavework() {
		return leavework;
	}
	public void setLeavework(DateTimeFormat leavework) {
		this.leavework = leavework;
	}
	
	
	
	
	
}
