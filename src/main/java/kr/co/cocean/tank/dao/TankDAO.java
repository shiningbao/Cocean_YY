package kr.co.cocean.tank.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.tank.dto.TankDTO;

@Mapper
public interface TankDAO {

	List<TankDTO> tankList(TankDTO tankDTO);

	List<Map<String, Object>> getBranch();

	int tankReg(Map<String, Object> params);

}
