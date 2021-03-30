package com.company.hospital.service.impl;

import java.util.List;

import com.company.hospital.service.HospitalVO;

public interface HospitalMapper {
	public int insertHospital(HospitalVO vo);
	public HospitalVO getHospital(HospitalVO vo);
	public List<HospitalVO> getSearchHospital(HospitalVO vo);
	public int updateHospital(HospitalVO vo);
	public int deleteHospital(HospitalVO vo);
}
