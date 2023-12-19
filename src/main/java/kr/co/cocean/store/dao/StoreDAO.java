package kr.co.cocean.store.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.store.dto.StoreDTO;

@Mapper
public interface StoreDAO {
	ArrayList<StoreDTO> branchList();

}
