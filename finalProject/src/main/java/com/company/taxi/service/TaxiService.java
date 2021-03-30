package com.company.taxi.service;

import java.util.List;

public interface TaxiService {
	public int insertTaxi(TaxiVO vo);	//화원탈퇴
	public TaxiVO getTaxi(TaxiVO vo);	//단건조회
	public List<TaxiVO> getSearchTaxi(TaxiVO vo);	//전체조회
	public int updateTaxi(TaxiVO vo);	//회원수정
	public int deleteTaxi(TaxiVO vo);	//화원탈퇴
}
