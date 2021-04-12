package com.company.integrated.service.impl;

import java.util.List;

import com.company.integrated.service.IntegratedVO;

public interface IntegratedMapper {
	public int insertIntegrated(IntegratedVO vo); // 상품등록

	public int updateIntegrated(IntegratedVO vo); // 상품수정

	public int deleteIntegrated(IntegratedVO vo); // 상품삭제

	public IntegratedVO getIntegrated(IntegratedVO vo); // 상세조회

	public List<IntegratedVO> getSearchIntegrated(IntegratedVO vo); // 전체조회

	public int getCount(IntegratedVO vo);// 레코드 조회

}
