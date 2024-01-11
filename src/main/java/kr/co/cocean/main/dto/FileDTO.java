package kr.co.cocean.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("file")
public class FileDTO {

	private int imageID;
	private String category;
	private int idx;
	private String path;
	private String serverFileName;
	private String oriFileName;
	private Date fileCreationDate;


	public int getImageID() {
		return imageID;
	}
	public void setImageID(int imageID) {
		this.imageID = imageID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getServerFileName() {
		return serverFileName;
	}
	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public Date getFileCreationDate() {
		return fileCreationDate;
	}
	public void setFileCreationDate(Date fileCreationDate) {
		this.fileCreationDate = fileCreationDate;
	}
}
