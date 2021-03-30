package com.company.payAndDelivery.service;

import java.util.List;

public interface PayAndDeliveryService {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);	//화원탈퇴
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);	//단건조회
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo);	//전체조회
	public int updatePayAndDelivery(PayAndDeliveryVO vo);	//회원수정
	public int deletePayAndDelivery(PayAndDeliveryVO vo);	//화원탈퇴
}
