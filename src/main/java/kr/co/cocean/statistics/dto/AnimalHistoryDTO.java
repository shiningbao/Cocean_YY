package kr.co.cocean.statistics.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

public class AnimalHistoryDTO {
	private int animalID;
	private int branchID;
	private String classificationCode;
	private String status;
	private Date entryDate;
	private String entryMonth;
	private String branchName;
	public int getAnimalID() {
		return animalID;
	}
	public void setAnimalID(int animalID) {
		this.animalID = animalID;
	}
	public int getBranchID() {
		return branchID;
	}
	public void setBranchID(int branchID) {
		this.branchID = branchID;
	}
	public String getClassificationCode() {
		return classificationCode;
	}
	public void setClassificationCode(String classificationCode) {
		this.classificationCode = classificationCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public String getEntryMonth() {
		return entryMonth;
	}
	public void setEntryMonth(String entryMonth) {
		this.entryMonth = entryMonth;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	
	
}
