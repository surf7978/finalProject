package com.company.payAndDelivery.service.impl;

import java.util.List;

import com.company.payAndDelivery.service.PayAndDeliveryVO;

public interface PayAndDeliveryMapper {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);

	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);

	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo);

	public int updatePayAndDelivery(PayAndDeliveryVO vo);

	public int deletePayAndDelivery(PayAndDeliveryVO vo);

	public int updateReservation2(PayAndDeliveryVO vo); // 예약수정(날짜선택)시 구매상태를 결제완료->예약완료변경
	
	// 결제설정
	public int insertPayAndDelivery2(PayAndDeliveryVO vo); // 결제 및 배송 추가
}
