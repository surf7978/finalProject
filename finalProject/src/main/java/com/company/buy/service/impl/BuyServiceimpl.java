package com.company.buy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.buy.service.BuyService;
import com.company.buy.service.BuyVO;

@Service
public class BuyServiceimpl implements BuyService{

	@Autowired BuyMapper buyMapper;
	
	//구매내역 상세리스트 조회
	@Override
	public List<BuyVO> getSearchBuy(BuyVO vo) {
		return buyMapper.getSearchBuy(vo);
	}
	
	//구매 한건 삭제
	@Override
	public int deleteBuy(BuyVO vo) {
		return buyMapper.deleteBuy(vo);
	}

}
