package kr.co.cocean.aquarium.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.aquarium.dao.AnimalDAO;
import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;

@Service
public class AnimalService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnimalDAO dao;

	public ArrayList<AnimalDTO> animalList() {
		return dao.animalList();
	}

	public ArrayList<ClassficationDTO> classficationSearch(String keyword) {
		
		return dao.classficationSearch(keyword);
	}
	
	
	
	
}
