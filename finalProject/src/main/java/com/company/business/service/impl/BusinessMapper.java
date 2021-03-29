package com.company.business.service.impl;

import com.company.business.service.BusinessVO;

public interface BusinessMapper {
	// RUD
	// 마이페이지-사업자-본인정보 조회
	public BusinessVO getBusiness(BusinessVO vo);

	// 마이페이지-사업자-본인정보 수정
	public int updateBusiness(BusinessVO vo);

	// 마이페이지-사업자-본인정보 삭제(탈퇴)
	public int deleteBusiness(BusinessVO vo);
}
