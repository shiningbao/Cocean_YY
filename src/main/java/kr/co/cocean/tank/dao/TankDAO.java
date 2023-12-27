package kr.co.cocean.tank.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.tank.dto.TankDTO;

@Mapper
public interface TankDAO {

	ArrayList<TankDTO> tankList();

}
