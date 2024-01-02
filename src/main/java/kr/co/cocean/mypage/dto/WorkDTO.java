package kr.co.cocean.mypage.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

@Alias("work")
public class WorkDTO {

	private int workID;
	private int employeeID;
	private Date workDate;
	private Timestamp gowork;
	private Timestamp leavework;

	 
	
	
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
	public Timestamp getGowork() {
		return gowork;
	}
	public void setGowork(Timestamp gowork) {
		this.gowork = gowork;
	}
	public Timestamp getLeavework() {
		return leavework;
	}
	public void setLeavework(Timestamp leavework) {
		this.leavework = leavework;
	}
	
	


	
	
	

	

	
	
	
	
	
}
