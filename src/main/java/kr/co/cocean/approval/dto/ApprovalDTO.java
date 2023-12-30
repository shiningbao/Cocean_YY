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

