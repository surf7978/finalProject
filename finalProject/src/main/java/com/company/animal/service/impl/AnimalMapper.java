package com.company.animal.service.impl;

import java.util.List;

import com.company.animal.service.AnimalVO;

public interface AnimalMapper {
	public int insertAnimal(AnimalVO vo);
	public AnimalVO getAnimal(AnimalVO vo);
	public List<AnimalVO> getSearchAnimal(AnimalVO vo);
	public int updateAnimal(AnimalVO vo);
	public int deleteAnimal(AnimalVO vo);
}
