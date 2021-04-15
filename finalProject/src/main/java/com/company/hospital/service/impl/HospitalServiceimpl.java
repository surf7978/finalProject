package com.company.hospital.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.hospital.service.HospitalService;
import com.company.hospital.service.HospitalVO;

@Service
public class HospitalServiceimpl implements HospitalService{
	
	@Autowired HospitalMapper hospitalMapper;
	//등록
	@Override
	public int insertHospital(HospitalVO vo) {
		return hospitalMapper.insertHospital(vo);
	}
	//단건조회
	@Override
	public HospitalVO getHospital(HospitalVO vo) {
		return hospitalMapper.getHospital(vo);
	}
	//전체조회
	@Override
	public List<HospitalVO> getSearchHospital(HospitalVO vo) {
		return hospitalMapper.getSearchHospital(vo);
	}
	//수정
	@Override
	public int updateHospital(HospitalVO vo) {
		return hospitalMapper.updateHospital(vo);
	}
	
	//탈퇴
	@Override
	public int deleteHospital(HospitalVO vo) {
		return hospitalMapper.deleteHospital(vo);
	}
	@Override
	public int getCount(HospitalVO vo) {
		return hospitalMapper.getCount(vo);
	}


}
