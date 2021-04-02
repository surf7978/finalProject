package com.company.cafe.service;

import java.util.List;

public interface CafeService {
	public int insertCafe(CafeVO vo); // 상품등록

	public int updateCafe(CafeVO vo); // 상품수정

	public int deleteCafe(CafeVO vo); // 상품삭제

	public CafeVO getCafe(CafeVO vo); // 단건조회

	public List<CafeVO> getSearchCafe(CafeVO vo); // 전체조회
}
