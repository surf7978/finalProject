package com.company.animal.service;

import java.util.List;

public interface AnimalService {
	public int insertAnimal(AnimalVO vo);	//화원탈퇴
	public AnimalVO getAnimal(AnimalVO vo);	//단건조회
	public List<AnimalVO> getSearchAnimal(AnimalVO vo);	//전체조회
	public int updateAnimal(AnimalVO vo);	//회원수정
	public int deleteAnimal(AnimalVO vo);	//화원탈퇴
}
