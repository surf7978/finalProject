package com.company.animal.service.impl;

import java.util.List;

import com.company.animal.service.AnimalVO;

public interface AnimalMapper {
	public int insertMember(AnimalVO vo);
	public AnimalVO getMember(AnimalVO vo);
	public List<AnimalVO> getSearchMember(AnimalVO vo);
	public int updateMember(AnimalVO vo);
	public int deleteMember(AnimalVO vo);
}
