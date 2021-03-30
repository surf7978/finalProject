package com.company.animal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.animal.service.AnimalService;
import com.company.animal.service.AnimalVO;

@Service
public class AnimalServiceimpl implements AnimalService{
	
	@Autowired AnimalMapper AnimalMapper;
	//등록
	@Override
	public int insertAnimal(AnimalVO vo) {
		return AnimalMapper.insertAnimal(vo);
	}
	//단건조회
	@Override
	public AnimalVO getAnimal(AnimalVO vo) {
		return AnimalMapper.getAnimal(vo);
	}
	//전체조회
	@Override
	public List<AnimalVO> getSearchAnimal(AnimalVO vo) {
		return AnimalMapper.getSearchAnimal(vo);
	}
	//수정
	@Override
	public int updateAnimal(AnimalVO vo) {
		return AnimalMapper.updateAnimal(vo);
	}
	
	//탈퇴
	@Override
	public int deleteAnimal(AnimalVO vo) {
		return AnimalMapper.deleteAnimal(vo);
	}


}
