package com.company.bCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.bCart.service.BCartService;
import com.company.bCart.service.BCartVO;

@Service
public class BCartServiceimpl implements BCartService {

	@Autowired
	BCartMapper bCartMapper;

	// 등록
	@Override
	public int insertBCart(BCartVO vo) {
		return bCartMapper.insertBCart(vo);
	}

	// 수정
	@Override
	public int updateBCart(BCartVO vo) {
		return bCartMapper.updateBCart(vo);
	}

	// 삭제
	@Override
	public int deleteBCart(BCartVO vo) {
		return bCartMapper.deleteBCart(vo);
	}

	// 단건조회
	@Override
	public BCartVO getBCart(BCartVO vo) {
		return bCartMapper.getBCart(vo);
	}

	// 전체조회
	@Override
	public List<BCartVO> getSearchTotalCart(BCartVO vo) {
		return bCartMapper.getSearchTotalCart(vo);
	}

}
