package com.company.buy.service;

import java.util.List;

public interface BuyService {
	public int insertBuy(BuyVO vo);	//화원탈퇴
	public BuyVO getBuy(BuyVO vo);	//단건조회
	public List<BuyVO> getSearchBuy(BuyVO vo);	//전체조회
	public int updateBuy(BuyVO vo);	//회원수정
	public int deleteBuy(BuyVO vo);	//화원탈퇴
}
