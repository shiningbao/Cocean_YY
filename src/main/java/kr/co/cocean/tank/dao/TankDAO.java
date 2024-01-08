package kr.co.cocean.tank.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.tank.dto.Pager;
import kr.co.cocean.tank.dto.TankDTO;
import kr.co.cocean.tank.dto.TankRecordDTO;

@Mapper
public interface TankDAO {

	List<TankDTO> tankList(Pager pager);

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

//	Long getTotalCount(Pager pager);

}
