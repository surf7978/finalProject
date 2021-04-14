package com.company.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.business.service.BusinessService;
import com.company.business.service.BusinessVO;

@Service
public class BusinessServiceimpl implements BusinessService{
	
	@Autowired BusinessMapper businessMapper;
	//등록
	@Override
	public int insertBusiness(BusinessVO vo) {
		return businessMapper.insertBusiness(vo);
	}
	//단건조회
	@Override
	public BusinessVO getBusiness(BusinessVO vo) {
		return businessMapper.getBusiness(vo);
	}
	//전체조회
	@Override
	public List<BusinessVO> getSearchBusiness(BusinessVO vo) {
		return businessMapper.getSearchBusiness(vo);
	}
	//수정
	@Override
	public int updateBusiness(BusinessVO vo) {
		return businessMapper.updateBusiness(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBusiness(BusinessVO vo) {
		return businessMapper.deleteBusiness(vo);
	}
	@Override
	public BusinessVO getBusinessId(BusinessVO vo) {
		return businessMapper.getBusinessId(vo);
	}


}
