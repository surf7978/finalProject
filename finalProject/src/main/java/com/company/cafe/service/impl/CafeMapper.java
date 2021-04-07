package com.company.cafe.service.impl;

import java.util.List;

import com.company.cafe.service.CafeVO;

public interface CafeMapper {
	public int insertCafe(CafeVO vo);
	public CafeVO getCafe(CafeVO vo);
	public List<CafeVO> getSearchCafe(CafeVO vo);
	public int updateCafe(CafeVO vo);
	public int deleteCafe(CafeVO vo);
	public int getCount(CafeVO vo);// 레코드 조회
}
