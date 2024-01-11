package kr.co.cocean.alarm.dto;

import org.apache.ibatis.type.Alias;

@Alias("alarm")
public class AlarmDTO {

	private int historyID;
	private int employeeID;
	private Boolean isRead;
	private String notificationTime;
	private String content;
	private String url;
	private String form;


	public int getHistoryID() {
		return historyID;
	}
	public void setHistoryID(int historyID) {
		this.historyID = historyID;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public Boolean getIsRead() {
		return isRead;
	}
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	public String getNotificationTime() {
		return notificationTime;
	}
	public void setNotificationTime(String notificationTime) {
		this.notificationTime = notificationTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}




}
