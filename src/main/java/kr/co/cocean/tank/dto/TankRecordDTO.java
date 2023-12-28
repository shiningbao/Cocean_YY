package kr.co.cocean.tank.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("Record")
public class TankRecordDTO {
	
	private int tankRecordID;
	private int tankID;
	private String timeSet;
	private String recordMercury;
	private String recordWaterLevel;
	private String recordSalinity;
	private String recordPh;
	private String recordDo;
	private String recordNitrates;
	private String recordNitrites;
	private String recordAmmonia;
	private String recordPhosphates;
	
	
	public String getTimeSet() {
		return timeSet;
	}
	
	public int getTankRecordID() {
		return tankRecordID;
	}
	public int getTankID() {
		return tankID;
	}

	public String getRecordMercury() {
		return recordMercury;
	}
	public String getRecordWaterLevel() {
		return recordWaterLevel;
	}
	public String getRecordSalinity() {
		return recordSalinity;
	}
	public String getRecordPh() {
		return recordPh;
	}
	public String getRecordDo() {
		return recordDo;
	}
	public String getRecordNitrates() {
		return recordNitrates;
	}
	public String getRecordNitrites() {
		return recordNitrites;
	}
	public String getRecordAmmonia() {
		return recordAmmonia;
	}
	public String getRecordPhosphates() {
		return recordPhosphates;
	}
	
	
	
	
	

}
