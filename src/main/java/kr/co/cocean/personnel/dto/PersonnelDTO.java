package kr.co.cocean.personnel.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Service;

@Alias("personnel")
public class PersonnelDTO {
	private String departmentName;
	private int employeeID;
	private int departmentID;
	private int positionID;
	private int rankID;
	private String password;
	private String name;
	private String status;
	private Date joinDate;
	private String phoneNumber;
	private String address;
	private int remainingAnnualLeave;
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public int getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	public int getPositionID() {
		return positionID;
	}
	public void setPositionID(int positionID) {
		this.positionID = positionID;
	}
	public int getRankID() {
		return rankID;
	}
	public void setRankID(int rankID) {
		this.rankID = rankID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRemainingAnnualLeave() {
		return remainingAnnualLeave;
	}
	public void setRemainingAnnualLeave(int remainingAnnualLeave) {
		this.remainingAnnualLeave = remainingAnnualLeave;
	}
	
	
}
