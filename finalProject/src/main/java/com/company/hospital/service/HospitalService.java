package com.company.hospital.service;

import java.util.List;

public interface HospitalService {
	public int insertHospital(HospitalVO vo);	//병원상품등록
	public HospitalVO getHospital(HospitalVO vo);	//병원상품 상세화면
	public List<HospitalVO> getSearchHospital(HospitalVO vo);	//병원상품 리스트
	public int updateHospital(HospitalVO vo);	//병원상품수정
	public int deleteHospital(HospitalVO vo);	//병원상품삭제
}
