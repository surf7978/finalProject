package com.company.taxi.service.impl;

import java.util.List;

import com.company.taxi.service.TaxiVO;

public interface TaxiMapper {
	public int insertMember(TaxiVO vo);
	public TaxiVO getMember(TaxiVO vo);
	public List<TaxiVO> getSearchMember(TaxiVO vo);
	public int updateMember(TaxiVO vo);
	public int deleteMember(TaxiVO vo);
}
