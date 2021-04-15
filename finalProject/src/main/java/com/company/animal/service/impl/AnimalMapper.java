package com.company.animal.service.impl;

import java.util.List;

import com.company.animal.service.AnimalVO;

public interface AnimalMapper {
	public int insertAnimal(AnimalVO vo);
	public AnimalVO getAnimal(AnimalVO vo);
	public List<AnimalVO> getSearchAnimal(AnimalVO vo);
	public int updateAnimal(AnimalVO vo);
	public int deleteAnimal(AnimalVO vo);
	
	public List<AnimalVO> getSearchAnimal99(AnimalVO vo);	//관리자용 반려동물들 리스트 조회
	public int deleteAnimal99(AnimalVO vo);	//탈퇴한 일반사용자 반려견 다건삭제
}
