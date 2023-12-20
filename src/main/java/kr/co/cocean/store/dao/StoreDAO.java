package kr.co.cocean.store.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.store.dto.StoreDTO;
import kr.co.cocean.store.dto.StoreProductDTO;

@Mapper
public interface StoreDAO {
	ArrayList<StoreDTO> branchList();

	ArrayList<StoreProductDTO> productList();

	ArrayList<StoreDTO> searchProduct( String branchName,String searchKeyword);

}
