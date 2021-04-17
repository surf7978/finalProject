package com.company.hospital.service;

import java.util.List;


public interface HospitalService {
	public int insertHospital(HospitalVO vo);	//병원상품등록
	public HospitalVO getHospital(HospitalVO vo);	//병원상품 상세화면
	public List<HospitalVO> getSearchHospital(HospitalVO vo);	//병원상품 리스트
	public int updateHospital(HospitalVO vo);	//병원상품수정
	public int deleteHospital(HospitalVO vo);	//병원상품삭제
	public int getCount(HospitalVO vo);// 레코드 조회
	public List<HospitalVO> getSearchHospital99(HospitalVO vo);	//아작스 전체 리스트
	public List<HospitalVO> getSearchHospitalLocation(HospitalVO vo);	//아작스 전체 리스트+지역별검색
}
