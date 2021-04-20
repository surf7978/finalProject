package com.company.payAndDelivery.service.impl;

import java.util.List;
import java.util.Map;

import com.company.payAndDelivery.service.PayAndDeliveryVO;

public interface PayAndDeliveryMapper {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);

	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);

	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo);

	public int updatePayAndDelivery(PayAndDeliveryVO vo);

	public int deletePayAndDelivery(PayAndDeliveryVO vo);

	public int updateReservation2(PayAndDeliveryVO vo); // 예약수정(날짜선택)시 구매상태를 결제완료->예약완료변경

	public int updateDelivery(PayAndDeliveryVO vo); // 관리자의 배송정보 입력

	// 결제설정
	public int insertPayAndDelivery2(PayAndDeliveryVO vo); // 결제 및 배송 추가

	public List<PayAndDeliveryVO> getSearchPayAndDelivery99(PayAndDeliveryVO vo); // 관리자용 구매내역 조회

	// 결제 내역 차트
	public List<Map<String, Object>> dailyTotal(PayAndDeliveryVO vo);// 일별합계

	public List<Map<String, Object>> monthlyTotal(PayAndDeliveryVO vo);// 월별합계

	public List<Map<String, Object>> yearsTotal(PayAndDeliveryVO vo);// 년별합계

	public List<Map<String, Object>> getDonutChart(PayAndDeliveryVO vo);// 도넛차트

	public List<Map<String, Object>> getAreaChart(PayAndDeliveryVO vo);// 비교차트
}
