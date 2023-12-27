package kr.co.cocean.store.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.store.dto.StoreDTO;
import kr.co.cocean.store.dto.StoreProductDTO;

@Mapper
public interface StoreDAO {

	ArrayList<StoreDTO> branchList();
	
	ArrayList<StoreProductDTO> branchProductList();

	ArrayList<StoreDTO> searchProduct( String searchKeyword,String branchName);

	int brachRegister(String branchName, String branchLocation, double branchLatitude, double branchLongitude);

	int branchSelect(String branchName);

	int branchRegisterProduct(int branchID, int i);

	int ticketRegister(String productName, int price, String category);

	int storeProductRegister(String productName, int price, String category);



}
