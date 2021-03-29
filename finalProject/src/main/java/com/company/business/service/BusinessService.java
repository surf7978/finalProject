package com.company.business.service;

public interface BusinessService {
	// RUD
	// 마이페이지-사업자-본인정보 단건조회
	public BusinessVO getBusiness(BusinessVO vo);

	// 마이페이지-사업자-본인정보 수정
	public int updateBusiness(BusinessVO vo);

	// 마이페이지-사업자-본인정보 삭제(탈퇴)
	public int deleteBusiness(BusinessVO vo);
}
