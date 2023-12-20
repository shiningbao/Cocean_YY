package kr.co.cocean.aquarium.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;

@Mapper
public interface AnimalDAO {

	ArrayList<AnimalDTO> animalList();

	ArrayList<ClassficationDTO> classficationSearch(String keyword);

}
