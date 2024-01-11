package kr.co.cocean.personnel.dto;



import java.time.format.DateTimeFormatter;

import org.apache.ibatis.type.Alias;

@Alias("history")
public class HistoryDTO {
	private int employeeID;
	private String startDate;
	private String endDate;
	private String  organizationName;
	private String remarks;
	private String category;
	private HistoryDTO[] historyArray;
	private HistoryDTO[] schistoryArray;

	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");


	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public DateTimeFormatter getFormatter() {
		return formatter;
	}
	public void setFormatter(DateTimeFormatter formatter) {
		this.formatter = formatter;
	}


	public HistoryDTO[] getHistoryArray() {
		return historyArray;
	}
	public void setHistoryArray(HistoryDTO[] historyArray) {
		this.historyArray = historyArray;
	}
	public HistoryDTO[] getSchistoryArray() {
		return schistoryArray;
	}
	public void setSchistoryArray(HistoryDTO[] schistoryArray) {
		this.schistoryArray = schistoryArray;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}


	public String getOrganizationName() {
		return organizationName;
	}
	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



}
