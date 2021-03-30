package com.company.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;

@Service
public class BusinessServiceimpl implements BusinessService{
	
	@Autowired BusinessMapper BusinessMapper;
	//등록
	@Override
	public int insertBusiness(BusinessVO vo) {
		return BusinessMapper.insertBusiness(vo);
	}
	//단건조회
	@Override
	public BusinessVO getBusiness(BusinessVO vo) {
		return BusinessMapper.getBusiness(vo);
	}
	//전체조회
	@Override
	public List<BusinessVO> getSearchBusiness(BusinessVO vo) {
		return BusinessMapper.getSearchBusiness(vo);
	}
	//수정
	@Override
	public int updateBusiness(BusinessVO vo) {
		return BusinessMapper.updateBusiness(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBusiness(BusinessVO vo) {
		return BusinessMapper.deleteBusiness(vo);
	}


}
