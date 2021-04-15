package com.company.payAndDelivery.service;

import java.util.List;

public interface PayAndDeliveryService {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo); 	//구매내역 조회(일반회원)
	public int updatePayAndDelivery(PayAndDeliveryVO vo);	
	public int deletePayAndDelivery(PayAndDeliveryVO vo);	//구매내역 삭제(일반회원)
	
	public int updateReservation2(PayAndDeliveryVO vo);	//예약수정(날짜선택)시 구매상태를 결제완료->예약완료변경
	public int updateDelivery(PayAndDeliveryVO vo);	//관리자의 배송정보 입력
	
	//결제설정
	public int insertPayAndDelivery2(PayAndDeliveryVO vo); //결제 및 배송 추가
	
	public List<PayAndDeliveryVO> getSearchPayAndDelivery99(PayAndDeliveryVO vo); 	//관리자용 구매내역 조회
}
