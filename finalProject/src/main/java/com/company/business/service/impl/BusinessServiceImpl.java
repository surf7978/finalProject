package com.company.business.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessMapper mapper;

	// 단건조회
	@Override
	public BusinessVO getBusiness(BusinessVO vo) {
		return mapper.getBusiness(vo);
	}

	// 수정
	@Override
	public int updateBusiness(BusinessVO vo) {
		return mapper.updateBusiness(vo);
	}

	// 삭제
	@Override
	public int deleteBusiness(BusinessVO vo) {
		return mapper.deleteBusiness(vo);
	}

}
