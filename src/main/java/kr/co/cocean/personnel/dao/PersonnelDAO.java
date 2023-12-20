package kr.co.cocean.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.personnel.dto.PersonnelDTO;

@Mapper
public interface PersonnelDAO {

	List<String> getResponsibility(String val);

	int join(HashMap<String, Object> params);

}
