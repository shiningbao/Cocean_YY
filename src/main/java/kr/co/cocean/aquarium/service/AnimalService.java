package kr.co.cocean.aquarium.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.cocean.aquarium.dao.AnimalDAO;
import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;

@Service
public class AnimalService {
	
	private String root = "C:/upload/cocean/";

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AnimalDAO dao;

	public ArrayList<AnimalDTO> animalList() {
		return dao.animalList();
	}

	public ArrayList<ClassficationDTO> classficationSearch(String keyword) {
		
		return dao.classficationSearch(keyword);
	}

	public ArrayList<String> tankList(String branch) {
		return dao.tankList(branch);
	}
	
	
	public String animalWrite(MultipartFile[] files, AnimalDTO param) {
		// 코션친구들 등록
		dao.animalWrte(param);

		// 첨부파일(이미지) 등록
		int animalID = param.getAnimalID();
		
		
		
//		for (MultipartFile uploadfile : files) {
//			upload(uploadfile);
//		}
		return null;
	}
	
	// 첨부파일 서버 저장
	public void upload(MultipartFile uploadfile, int animalID) {
		
		String oriFileName = uploadfile.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;	
		
		try {
			byte[] bytes = uploadfile.getBytes();
			Path path = Paths.get(root+"animal/"+newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
