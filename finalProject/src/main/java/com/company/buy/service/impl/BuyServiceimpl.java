package com.company.buy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;

@Service
public class BuyServiceimpl implements BuyService{
	
	@Autowired BuyMapper BuyMapper;
	//등록
	@Override
	public int insertBuy(BuyVO vo) {
		return BuyMapper.insertBuy(vo);
	}
	//단건조회
	@Override
	public BuyVO getBuy(BuyVO vo) {
		return BuyMapper.getBuy(vo);
	}
	//전체조회
	@Override
	public List<BuyVO> getSearchBuy(BuyVO vo) {
		return BuyMapper.getSearchBuy(vo);
	}
	//수정
	@Override
	public int updateBuy(BuyVO vo) {
		return BuyMapper.updateBuy(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBuy(BuyVO vo) {
		return BuyMapper.deleteBuy(vo);
	}


}
