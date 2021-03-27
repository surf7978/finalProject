package com.company.hospital.service.impl;

import java.util.List;

import com.company.hospital.service.HospitalVO;

public interface HospitalMapper {
	public int insertMember(HospitalVO vo);
	public HospitalVO getMember(HospitalVO vo);
	public List<HospitalVO> getSearchMember(HospitalVO vo);
	public int updateMember(HospitalVO vo);
	public int deleteMember(HospitalVO vo);
}
