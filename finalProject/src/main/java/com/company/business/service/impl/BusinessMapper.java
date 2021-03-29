package com.company.business.service.impl;

import java.util.List;

import com.company.business.service.BusinessVO;

public interface BusinessMapper {
	public int insertBusiness(BusinessVO vo); //사업자 등록
	public BusinessVO getBusiness(BusinessVO vo); //사업자 단건조회
	public List<BusinessVO> getSearchBusiness(BusinessVO vo); //사업자 전체조회
	public int updateBusiness(BusinessVO vo); //사업자 수정
	public int deleteBusiness(BusinessVO vo); //사업자 탈퇴
}
