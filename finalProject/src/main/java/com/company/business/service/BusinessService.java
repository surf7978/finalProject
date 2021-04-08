package com.company.business.service;

import java.util.List;

public interface BusinessService {
	public int insertBusiness(BusinessVO vo); // 화원탈퇴

	public BusinessVO getBusiness(BusinessVO vo); // 단건조회

	public List<BusinessVO> getSearchBusiness(BusinessVO vo); // 전체조회

	public int updateBusiness(BusinessVO vo); // 회원수정

	public int deleteBusiness(BusinessVO vo); // 화원탈퇴
	
	public BusinessVO getBusinessId(BusinessVO vo); // 사업자번호로 사업자아이디 조회
}
