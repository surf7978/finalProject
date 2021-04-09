package com.company.animal.service;

import java.util.List;

public interface AnimalService {
	public int insertAnimal(AnimalVO vo);	//동물 등록
	public AnimalVO getAnimal(AnimalVO vo);	//동물 한마리 상세 조회(의료수첩)
	public List<AnimalVO> getSearchAnimal(AnimalVO vo);	//내 반려동물들 리스트 조회
	public int updateAnimal(AnimalVO vo);	//동물 정보 수정
	public int deleteAnimal(AnimalVO vo);	//동물 삭제
	public List<AnimalVO> getSearchAnimal99(AnimalVO vo);	//관리자용 반려동물들 리스트 조회
}
