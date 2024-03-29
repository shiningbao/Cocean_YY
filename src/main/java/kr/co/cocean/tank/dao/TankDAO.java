package kr.co.cocean.tank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.dto.TankRecordDTO;

@Mapper
public interface TankDAO {

	List<TankDTO> tankList(HashMap<String, Object> params);

	List<Map<String, Object>> getBranch();

	int tankReg(Map<String, Object> params);

	int mngItem(Map<String, Object> params);

	int inChargeTank(Map<String, Object> params);

	HashMap<String, Object> tankDetail(int tankID);

	List<TankRecordDTO> getChart(String tankID, String recordDate);

	int tankSet(Map<String, Object> params);

	List<Map<String, Object>> tankAnimal(int tankID);

	List<Integer> tankCount();

	int recordData(Map<String, Integer> map);

	String getEm(int tankID);

//	HashMap<String, Object> logForm(int tankID);

	HashMap<String, Object> recentRecord(int tankID);

	List<Map<String, Object>> recordList(String tankID, String curDate);

	Integer totalCount(HashMap<String, Object> params);

	int addPlan(HashMap<String, Object> params);

	List<Map<String, Object>> getPlan(HashMap<String, Object> params);

	int removePlan(int logID);

	int donePlan(int logID);

	HashMap<String, Object> getStandard(Integer tankID);

	int abNormal(HashMap<String, Object> chkValue);

	int tankStatus(HashMap<String, Object> chkValue);

	int nomal(Integer tankID);

	List<Map<String, Object>> getAbNomal(String tankID, String curDate);



}
