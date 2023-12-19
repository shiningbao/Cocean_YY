package kr.co.cocean.approval.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.approval.dto.ApprovalDTO;
@Mapper
public interface ApprovalDAO {

	ArrayList<ApprovalDTO> list();

}
