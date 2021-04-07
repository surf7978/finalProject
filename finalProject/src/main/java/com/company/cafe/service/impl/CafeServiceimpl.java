package com.company.cafe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.cafe.service.CafeService;
import com.company.cafe.service.CafeVO;

@Service
public class CafeServiceimpl implements CafeService {

	@Autowired
	CafeMapper CafeMapper;

	// 등록
	@Override
	public int insertCafe(CafeVO vo) {
		return CafeMapper.insertCafe(vo);
	}

	// 수정
	@Override
	public int updateCafe(CafeVO vo) {
		return CafeMapper.updateCafe(vo);
	}

	// 삭제
	@Override
	public int deleteCafe(CafeVO vo) {
		return CafeMapper.deleteCafe(vo);
	}

	// 단건조회
	@Override
	public CafeVO getCafe(CafeVO vo) {
		return CafeMapper.getCafe(vo);
	}

	// 전체조회
	@Override
	public List<CafeVO> getSearchCafe(CafeVO vo) {
		return CafeMapper.getSearchCafe(vo);
	}

	// 레코드조회
	@Override
	public int getCount(CafeVO vo) {
		return CafeMapper.getCount(vo);
	}

	// Cafe,Hotel,Taxi 조회
	@Override
	public List<CafeVO> getSearchList1(CafeVO vo) {
		return CafeMapper.getSearchList1(vo);
	}

	// Cafe,Hotel,Taxi 레코드 조회
	@Override
	public int getCountList1(CafeVO vo) {
		return CafeMapper.getCountList1(vo);
	}

}
