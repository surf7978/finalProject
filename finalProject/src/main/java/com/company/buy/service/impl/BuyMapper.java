package com.company.buy.service.impl;

import java.util.List;

import com.company.buy.service.BuyVO;

public interface BuyMapper {
	public List<BuyVO> getSearchBuy(BuyVO vo);	//구매내역 상세조회
	public int deleteBuy(BuyVO vo);		//구매내역 한건 삭제
}
