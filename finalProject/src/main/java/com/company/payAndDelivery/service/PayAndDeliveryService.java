package com.company.payAndDelivery.service;

import java.util.List;

public interface PayAndDeliveryService {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo); 	//구매내역 조회(일반회원)
	public int updatePayAndDelivery(PayAndDeliveryVO vo);	
	public int deletePayAndDelivery(PayAndDeliveryVO vo);	//구매내역 삭제(일반회원)
}
