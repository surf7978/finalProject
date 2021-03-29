package com.company.bCart.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;

@Service
public class BCartServiceImpl implements BCartService {

	@Autowired
	BCartMapper bCartMapper;

	// 등록
	@Override
	public void insertBCart(BCartVO vo) {
		bCartMapper.insertBCart(vo);
	}

	// 삭제
	@Override
	public void deleteBCart(BCartVO vo) {
		bCartMapper.deleteBCart(vo);
	}

	// 단건조회
	@Override
	public BCartVO getBCart(BCartVO vo) {
		return bCartMapper.getBCart(vo);
	}
}
