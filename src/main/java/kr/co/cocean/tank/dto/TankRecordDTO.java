package kr.co.cocean.tank.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("Record")
public class TankRecordDTO {
	
	private int tankRecordID;
	private int tankID;
	private Date recordDate;
	private String recordTime;
	
	
	

}
