package com.company.taxi.service.impl;

import java.util.List;

import com.company.taxi.service.TaxiVO;

public interface TaxiMapper {
	public int insertTaxi(TaxiVO vo);
	public TaxiVO getTaxi(TaxiVO vo);
	public List<TaxiVO> getSearchTaxi(TaxiVO vo);
	public int updateTaxi(TaxiVO vo);
	public int deleteTaxi(TaxiVO vo);
}
