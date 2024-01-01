package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("tankHistory")
public class TankHistoryDTO {
	private int tankID;
	private int categoryID;
	private int branchID;
	private Date registrationDate;
	private String tankStatus;
	private String tankType;
	public int getTankID() {
		return tankID;
	}
	public void setTankID(int tankID) {
		this.tankID = tankID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getTankStatus() {
		return tankStatus;
	}
	public void setTankStatus(String tankStatus) {
		this.tankStatus = tankStatus;
	}
	public String getTankType() {
		return tankType;
	}
	public void setTankType(String tankType) {
		this.tankType = tankType;
	}
	
	
}
