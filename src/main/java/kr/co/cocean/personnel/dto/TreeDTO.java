package kr.co.cocean.personnel.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Service;

@Alias("tree")
public class TreeDTO {
	private String id;
	private String parent;
	private String text;
	private String icon;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
}
