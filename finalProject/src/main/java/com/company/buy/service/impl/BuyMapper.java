package com.company.buy.service.impl;

import java.util.List;

import com.company.buy.service.BuyVO;

public interface BuyMapper {
	public int insertBuy(BuyVO vo);
	public BuyVO getBuy(BuyVO vo);
	public List<BuyVO> getSearchBuy(BuyVO vo);
	public int updateBuy(BuyVO vo);
	public int deleteBuy(BuyVO vo);
}
