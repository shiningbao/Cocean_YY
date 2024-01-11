package kr.co.cocean.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.WorkDAO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Service
public class WorkService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired WorkDAO dao;




	public Map<String, Object> worklist(String pfirstSearchDate, String plastSearchDate, int userId) {
		ArrayList<WorkDTO> workdto = dao.worklist(pfirstSearchDate,plastSearchDate,userId);
		Map<String, Object>map= new HashMap<>();
		map.put("work", workdto);
		return map;
	}

	/*
	public Map<String, Object> worklist(String pfirstSearchDate, String plastSearchDate, int userId) {
		ArrayList<WorkDTO> workdto = dao.worklist(pfirstSearchDate,plastSearchDate,userId);
		Map<String, Object>map= new HashMap<String, Object>();
		map.put("work", workdto);
		return map;
	}*/


	/* 페이징
	public Map<String, Object> worklist(String pfirstSearchDate, String plastSearchDate, int userId, int pageNum) {
	    Pager pager = new Pager();
	    pager.setPageNum(pageNum);
	    pager.setPageSize(10);

	    // Service에서 데이터 가져오기
	    ArrayList<WorkDTO> workdto = dao.worklist(pfirstSearchDate, plastSearchDate, userId, pager);

	    Map<String, Object> result = new HashMap<>();
	    result.put("work", workdto);
	    result.put("pager", pager);

	    return result;
	}
*/



	/*
	public Map<String, Object> worklist(String pfirstSearchDate, String plastSearchDate, int userId) {
	    // 페이저 초기화
	    Pager pager = new Pager();
	    pager.setPageNum(pageNum);
	    pager.setPageSize(10);


	    ArrayList<WorkDTO> workdto = dao.worklist(pfirstSearchDate, plastSearchDate, userId, pager);

	    // 전체 데이터의 수를 조회하여 Pager에 설정
	    HashMap<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("pfirstSearchDate", pfirstSearchDate);
	    params.put("plastSearchDate", plastSearchDate);
	    Integer total = dao.totalCount(params);
	    pager.setTotalCount(total > 0 ? total : 1);

	    // 결과 Map에 작업 목록과 페이저 정보 추가
	    Map<String, Object> result = new HashMap<>();
	    result.put("work", workdto);
	    result.put("pager", pager);

	    return result;
	}

	*/
	//출근
	public Map<String, Object> gocheck(Map<String, Object> data, int userId) {
	    logger.info("출근 서비스 접속");
	    logger.info("data: " + data);


	    // timedata와 datedata 맵을 뽑아냄
	    Object timedataObj = data.get("timedata");
	    Object datedataObj = data.get("datedate");

	    // 데이터가 Map 타입인지 확인
	    if (!(timedataObj instanceof Map) || !(datedataObj instanceof Map)) {
	        logger.error("timedata or datedata is not of type Map");
	        // 에러 처리 또는 예외 상황에 대한 처리 추가
	        // 예: throw new IllegalArgumentException("Invalid data format");
	    }

	    Map<String, String> timedata = (Map<String, String>) timedataObj;
	    Map<String, String> datedata = (Map<String, String>) datedataObj;

	    // timedata와 datedata의 값을 개별적으로 추출
	    String timedataValue = timedata.get("timedata");
	    String datedataValue = datedata.get("datedate");

	    // 로그에 개별 값 찍어보기
	    logger.info("timedata: " + timedataValue);
	    logger.info("datedata: " + datedataValue);

	    //문제점 리스트,어레이리스트로 계속 보내서그럼
	    int workDTO = dao.gocheck(timedataValue, datedataValue, userId);
	    logger.info("workdto:" + workDTO);

	    // 최종 결과를 담을 Map 생성 및 결과 추가
	    Map<String, Object> map = new HashMap<>();
	    map.put("gcheck", workDTO);
	    logger.info("map:" + map);

	    return map;

	}







//퇴근
	public Map<String, Object> leavecheck(Map<String, Object> data, int userId) {
		logger.info("퇴근 서비스 접속");
	    logger.info("data: " + data);


	    // timedata와 datedata 맵을 뽑아냄
	    Object timedataObj = data.get("timedata");
	    Object datedataObj = data.get("datedate");

	    // 데이터가 Map 타입인지 확인
	    if (!(timedataObj instanceof Map) || !(datedataObj instanceof Map)) {
	        logger.error("timedata or datedata is not of type Map");
	        // 에러 처리 또는 예외 상황에 대한 처리 추가
	        // 예: throw new IllegalArgumentException("Invalid data format");
	    }

	    Map<String, String> timedata = (Map<String, String>) timedataObj;
	    Map<String, String> datedata = (Map<String, String>) datedataObj;

	    // timedata와 datedata의 값을 개별적으로 추출
	    String timedataValue = timedata.get("timedata");
	    String datedataValue = datedata.get("datedate");

	    // 로그에 개별 값 찍어보기
	    logger.info("timedata: " + timedataValue);
	    logger.info("datedata: " + datedataValue);


	    int workDTO = dao.leavecheck(timedataValue, datedataValue, userId);
	    logger.info("workdto:" + workDTO);

	    // 최종 결과를 담을 Map 생성 및 결과 추가
	    Map<String, Object> map = new HashMap<>();
	    map.put("gcheck", workDTO);
	    logger.info("map:" + map);

	    return map;
	}

















}
