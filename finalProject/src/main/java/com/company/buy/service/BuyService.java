package com.company.buy.service;

import java.util.List;

public interface BuyService {

	public List<BuyVO> getSearchBuy(BuyVO vo);	//구매내역 상세조회
	public int deleteBuy(BuyVO vo);		//구매내역 한건 삭제
}
