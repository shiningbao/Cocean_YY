package kr.co.cocean.approval.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("approval")
public class ApprovalDTO {

	private String titleID;
	private String category;
	private String formTitle;
	private String name;
	private String departmentName;
	private String rankName;
	private String hqName;
	private int idx;
	private int employeeID;
	private int publicStatus;
	private int tempSave;
	private String documentNo;
	private String content;
	private Date draftDate;
	private int approvalID;
	private String approvalStatus;
	private String title;
	private String oriFileName;
	private int imageID;
	private String serverFileName;
	private String approvalOrder;
	private String opinion;
	private Date approvalDate;
	private String startDate;
	private String endDate;
	private String textArea;
	private String remainingAnnualLeave;
	private String vacationCategory;
	private int usageTime;
	private String draftStatus;
	private Date vacationStartDate;
	private Date vacationEndDate;
	private String vacationReason;
	private String leaveStartDate;
	private String leaveEndDate;
	private String leaveReason;
	private String formCategory;
	
	
	public String getFormCategory() {
		return formCategory;
	}
	public void setFormCategory(String formCategory) {
		this.formCategory = formCategory;
	}
	public String getLeaveStartDate() {
		return leaveStartDate;
	}
	public void setLeaveStartDate(String leaveStartDate) {
		this.leaveStartDate = leaveStartDate;
	}
	public String getLeaveEndDate() {
		return leaveEndDate;
	}
	public void setLeaveEndDate(String leaveEndDate) {
		this.leaveEndDate = leaveEndDate;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}
	public Date getVacationStartDate() {
		return vacationStartDate;
	}
	public void setVacationStartDate(Date vacationStartDate) {
		this.vacationStartDate = vacationStartDate;
	}
	public Date getVacationEndDate() {
		return vacationEndDate;
	}
	public void setVacationEndDate(Date vacationEndDate) {
		this.vacationEndDate = vacationEndDate;
	}
	public String getVacationReason() {
		return vacationReason;
	}
	public void setVacationReason(String vacationReason) {
		this.vacationReason = vacationReason;
	}
	public String getDraftStatus() {
		return draftStatus;
	}
	public void setDraftStatus(String draftStatus) {
		this.draftStatus = draftStatus;
	}
	public String getVacationCategory() {
		return vacationCategory;
	}
	public void setVacationCategory(String vacationCategory) {
		this.vacationCategory = vacationCategory;
	}
	public int getUsageTime() {
		return usageTime;
	}
	public void setUsageTime(int usageTime) {
		this.usageTime = usageTime;
	}
	
	public String getRemainingAnnualLeave() {
		return remainingAnnualLeave;
	}
	public void setRemainingAnnualLeave(String remainingAnnualLeave) {
		this.remainingAnnualLeave = remainingAnnualLeave;
	}
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
	public String getTextArea() {
		return textArea;
	}
	public void setTextArea(String textArea) {
		this.textArea = textArea;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public String getApprovalOrder() {
		return approvalOrder;
	}
	public void setApprovalOrder(String approvalOrder) {
		this.approvalOrder = approvalOrder;
	}
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}
	public int getImageID() {
		return imageID;
	}
	public void setImageID(int imageID) {
		this.imageID = imageID;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getFormTitle() {
		return formTitle;
	}
	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}
	
	public Date getDraftDate() {
		return draftDate;
	}
	public void setDraftDate(Date draftDate) {
		this.draftDate = draftDate;
	}
	public int getApprovalID() {
		return approvalID;
	}
	public void setApprovalID(int approvalID) {
		this.approvalID = approvalID;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public int getPublicStatus() {
		return publicStatus;
	}
	public void setPublicStatus(int publicStatus) {
		this.publicStatus = publicStatus;
	}
	public int getTempSave() {
		return tempSave;
	}
	public void setTempSave(int tempSave) {
		this.tempSave = tempSave;
	}
	public String getDocumentNo() {
		return documentNo;
	}
	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getHqName() {
		return hqName;
	}
	public void setHqName(String hqName) {
		this.hqName = hqName;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleID() {
		return titleID;
	}
	public void setTitleID(String titleID) {
		this.titleID = titleID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

}

