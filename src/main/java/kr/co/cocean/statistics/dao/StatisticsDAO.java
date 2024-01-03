package kr.co.cocean.statistics.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.statistics.dto.AnimalHistoryDTO;
import kr.co.cocean.statistics.dto.SalesHistoryDTO;
import kr.co.cocean.statistics.dto.TankHistoryDTO;

@Mapper
public interface StatisticsDAO {

	ArrayList<AnimalHistoryDTO> animalHistory();
	
	ArrayList<TankHistoryDTO> tankHistory();

	ArrayList<SalesHistoryDTO> productHistory();

	ArrayList<SalesHistoryDTO> ticketHistory();

	ArrayList<SalesHistoryDTO> visitorsHistory();


}
