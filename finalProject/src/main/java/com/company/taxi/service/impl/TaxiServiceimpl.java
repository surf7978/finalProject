package com.company.taxi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.taxi.service.TaxiService;
import com.company.taxi.service.TaxiVO;

@Service
public class TaxiServiceimpl implements TaxiService{
	
	@Autowired TaxiMapper TaxiMapper;
	//등록
	@Override
	public int insertTaxi(TaxiVO vo) {
		return TaxiMapper.insertTaxi(vo);
	}
	//단건조회
	@Override
	public TaxiVO getTaxi(TaxiVO vo) {
		return TaxiMapper.getTaxi(vo);
	}
	//전체조회
	@Override
	public List<TaxiVO> getSearchTaxi(TaxiVO vo) {
		return TaxiMapper.getSearchTaxi(vo);
	}
	//수정
	@Override
	public int updateTaxi(TaxiVO vo) {
		return TaxiMapper.updateTaxi(vo);
	}
	
	//탈퇴
	@Override
	public int deleteTaxi(TaxiVO vo) {
		return TaxiMapper.deleteTaxi(vo);
	}


}
