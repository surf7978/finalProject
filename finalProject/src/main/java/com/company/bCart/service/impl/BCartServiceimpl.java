package com.company.bCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;

@Service
public class BCartServiceimpl implements BCartService {

	@Autowired
	BCartMapper BCartMapper;

	// 등록
	@Override
	public int insertBCart(BCartVO vo) {
		return BCartMapper.insertBCart(vo);
	}

	// 단건조회
	@Override
	public BCartVO getBCart(BCartVO vo) {
		return BCartMapper.getBCart(vo);
	}

	// 전체조회
	@Override
	public List<BCartVO> getSearchBCart(BCartVO vo) {
		return BCartMapper.getSearchBCart(vo);
	}

	// 수정
	@Override
	public int updateBCart(BCartVO vo) {
		return BCartMapper.updateBCart(vo);
	}

	// 탈퇴
	@Override
	public int deleteBCart(BCartVO vo) {
		return BCartMapper.deleteBCart(vo);
	}

}
