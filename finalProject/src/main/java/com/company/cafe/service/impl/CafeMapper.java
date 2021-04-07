package com.company.cafe.service.impl;

import java.util.List;

import com.company.cafe.service.CafeVO;

public interface CafeMapper {

	public int insertCafe(CafeVO vo);// 등록

	public int updateCafe(CafeVO vo);// 수정

	public int deleteCafe(CafeVO vo);// 삭제

	public CafeVO getCafe(CafeVO vo);// 상세조회

	public List<CafeVO> getSearchCafe(CafeVO vo);// 전체조회

	public int getCount(CafeVO vo);// 레코드 조회

	public List<CafeVO> getSearchList1(CafeVO vo); // Cafe,Hotel,Taxi 리스트 조회

	public int getCountList1(CafeVO vo);// Cafe,Hotel,Taxi 레코드 조회
}
