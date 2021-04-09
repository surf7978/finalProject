package com.company.integrated.service;

import java.util.List;

public interface IntegratedService {
	public int insertIntegrated(IntegratedVO vo); // 상품등록

	public int updateIntegrated(IntegratedVO vo); // 상품수정

	public int deleteIntegrated(IntegratedVO vo); // 상품삭제

	public IntegratedVO getIntegrated(IntegratedVO vo); // 상세조회

	public List<IntegratedVO> getSearchIntegratedVO(IntegratedVO vo); // 전체조회

	public int getCount(IntegratedVO vo);// 레코드 조회

}
