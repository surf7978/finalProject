package com.company.taxi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.taxi.service.TaxiService;
import com.company.taxi.service.TaxiVO;

@Service
public class TaxiServiceimpl implements TaxiService{
	
	@Autowired TaxiMapper taxiMapper;
	//등록
	@Override
	public int insertTaxi(TaxiVO vo) {
		return taxiMapper.insertTaxi(vo);
	}
	//단건조회
	@Override
	public TaxiVO getTaxi(TaxiVO vo) {
		return taxiMapper.getTaxi(vo);
	}
	//전체조회
	@Override
	public List<TaxiVO> getSearchTaxi(TaxiVO vo) {
		return taxiMapper.getSearchTaxi(vo);
	}
	//수정
	@Override
	public int updateTaxi(TaxiVO vo) {
		return taxiMapper.updateTaxi(vo);
	}
	
	//탈퇴
	@Override
	public int deleteTaxi(TaxiVO vo) {
		return taxiMapper.deleteTaxi(vo);
	}


}
