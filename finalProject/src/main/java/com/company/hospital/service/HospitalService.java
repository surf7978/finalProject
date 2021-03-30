package com.company.hospital.service;

import java.util.List;

public interface HospitalService {
	public int insertHospital(HospitalVO vo);	//화원탈퇴
	public HospitalVO getHospital(HospitalVO vo);	//단건조회
	public List<HospitalVO> getSearchHospital(HospitalVO vo);	//전체조회
	public int updateHospital(HospitalVO vo);	//회원수정
	public int deleteHospital(HospitalVO vo);	//화원탈퇴
}
