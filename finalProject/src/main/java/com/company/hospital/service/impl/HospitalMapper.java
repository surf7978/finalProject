package com.company.hospital.service.impl;

import java.util.List;

import com.company.hospital.service.HospitalVO;

public interface HospitalMapper {
	public int insertHospital(HospitalVO vo);
	public HospitalVO getHospital(HospitalVO vo);
	public List<HospitalVO> getSearchHospital(HospitalVO vo);
	public int updateHospital(HospitalVO vo);
	public int deleteHospital(HospitalVO vo);
	public int getCount(HospitalVO vo);// 레코드 조회
	public List<HospitalVO> getSearchHospital99(HospitalVO vo);	//아작스 전체 리스트
	public List<HospitalVO> getSearchHospitalLocation(HospitalVO vo);	//아작스 전체 리스트+지역별검색
}
