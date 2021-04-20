package com.company.buy.service;

import java.util.List;

public interface BuyService {

	public List<BuyVO> getSearchBuy(BuyVO vo);	//구매내역 상세조회
	public BuyVO getViewBuy(BuyVO vo);	//뷰 단건조회
	public int deleteBuy(BuyVO vo);		//구매내역 한건 삭제
	public int getBuy(BuyVO vo);		//쇼핑몰구매내역 단건조회 for 구매평작성
	
	//결제 설정 
	public int insertBuy2(BuyVO vo); //구매상세정보 추가
	//장바구니 다중insert
	public int insertCartBuy(List<BuyVO> list);
}
