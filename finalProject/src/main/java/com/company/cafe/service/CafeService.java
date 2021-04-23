package com.company.cafe.service;

import java.util.List;

public interface CafeService {
	public int insertCafe(CafeVO vo); // 상품등록

	public int updateCafe(CafeVO vo); // 상품수정

	public int deleteCafe(CafeVO vo); // 상품삭제

	public CafeVO getCafe(CafeVO vo); // 상세조회

	public List<CafeVO> getSearchCafe(CafeVO vo); // 전체조회

	public int getCount(CafeVO vo);// 레코드 조회

	public List<CafeVO> getSearchList1(CafeSearchVO vo); // Cafe,Hotel,Taxi 리스트 조회

	public int getCountList1(CafeVO vo);// Cafe,Hotel,Taxi 레코드 조회	  //
	
	public List<CafeVO> adminView(CafeVO vo); // adminView전체조회
}
