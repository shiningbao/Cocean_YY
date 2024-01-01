package kr.co.cocean.statistics.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.statistics.dto.ProductHistoryDTO;
import kr.co.cocean.statistics.dto.TankHistoryDTO;
import kr.co.cocean.statistics.dto.TicketHistoryDTO;
import kr.co.cocean.statistics.dto.VisitorsHistoryDTO;

@Mapper
public interface StatisticsDAO {

	AnimalDTO animalHistory();
	
	TankHistoryDTO tankHistory();

	ProductHistoryDTO productHistory();

	TicketHistoryDTO ticketHistroy();

	VisitorsHistoryDTO visitorsHistory();

}
