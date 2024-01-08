package kr.co.cocean.store.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import kr.co.cocean.store.dto.StoreDTO;
import kr.co.cocean.store.dto.StoreProductDTO;

@Mapper
public interface StoreDAO {

	ArrayList<StoreDTO> branchList();
	
	ArrayList<StoreProductDTO> branchProductList();
	
	ArrayList<StoreProductDTO> totalProductNumber();
	
	ArrayList<StoreProductDTO> branchTicketList();

	ArrayList<StoreProductDTO> searchProduct( String searchKeyword,String branchName);
	
	int brachRegister(String branchName, String branchLocation, double branchLatitude, double branchLongitude);

	int branchSelect(String branchName);

	int branchRegisterProduct(int branchID, int i);

	ArrayList<StoreProductDTO> modalProductList(String currentBranchName);

	ArrayList<StoreProductDTO> modalTicketList(String currentBranchName);
	
	int branchIDSearch(String currentBranchName);

	int productIDSearch(String currentProductName);

	int branchProductRegister(int branchID, int productID);

	StoreProductDTO storeProductDetail(int productID);

	int productInfoRegister(Map<String, String> params);

	int productInfoID(String productName);

	int productFileRegister(String category, int productID, String path, String newFileName, String oriFileName);

	void branchProductDelete(int productID, int branchID);


	




}
