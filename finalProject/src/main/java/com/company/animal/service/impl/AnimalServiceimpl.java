package com.company.animal.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;

@Service
public class AnimalServiceimpl implements AnimalService {

	@Autowired
	AnimalMapper animalMapper;

	// 동물 등록
	@Override
	public int insertAnimal(AnimalVO vo) {
		return animalMapper.insertAnimal(vo);
	}

	// 동물 한마리 조회(의료수첩)
	@Override
	public AnimalVO getAnimal(AnimalVO vo) {
		return animalMapper.getAnimal(vo);
	}

	// 내 반려동물들 리스트 조회
	@Override
	public List<AnimalVO> getSearchAnimal(AnimalVO vo) {
		return animalMapper.getSearchAnimal(vo);
	}

	// 동물 정보 수정
	@Override
	public int updateAnimal(AnimalVO vo) {
		return animalMapper.updateAnimal(vo);
	}

	// 동물 삭제
	@Override
	public int deleteAnimal(AnimalVO vo) {
		return animalMapper.deleteAnimal(vo);
	}

	// 관리자용 반려동물들 조회
	@Override
	public List<AnimalVO> getSearchAnimal99(AnimalVO vo) {
		return animalMapper.getSearchAnimal99(vo);
	}

	// 탈퇴한 일반사용자 반려견 다건삭제
	@Override
	public int deleteAnimal99(AnimalVO vo) {
		return animalMapper.deleteAnimal99(vo);
	}

	// 관리자 동물차트
	@Override
	public List<Map<String, Object>> getAnimalChart(AnimalVO vo) {
		return animalMapper.getAnimalChart(vo);
	}

}
