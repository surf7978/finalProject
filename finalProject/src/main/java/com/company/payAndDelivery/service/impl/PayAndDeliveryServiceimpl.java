package com.company.payAndDelivery.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;

@Service
public class PayAndDeliveryServiceimpl implements PayAndDeliveryService {

	@Autowired
	PayAndDeliveryMapper payAndDeliveryMapper;

	@Override
	public int insertPayAndDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.insertPayAndDelivery(vo);
	}

	@Override
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.getPayAndDelivery(vo);
	}

	@Override
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.getSearchPayAndDelivery(vo);
	}

	@Override
	public int updatePayAndDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.updatePayAndDelivery(vo);
	}

	@Override
	public int deletePayAndDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.deletePayAndDelivery(vo);
	}

	@Override
	public int updateReservation2(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.updateReservation2(vo);
	}

	@Override
	public int insertPayAndDelivery2(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.insertPayAndDelivery2(vo);
	}

	@Override
	public List<PayAndDeliveryVO> getSearchPayAndDelivery99(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.getSearchPayAndDelivery99(vo);
	}

	@Override
	public int updateDelivery(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.updateDelivery(vo);
	}

	// 결제 내역 차트
	@Override
	public List<Map<String, Object>> dailyTotal(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.dailyTotal(vo);
	}

	@Override
	public List<Map<String, Object>> monthlyTotal(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.monthlyTotal(vo);
	}

	@Override
	public List<Map<String, Object>> yearsTotal(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.yearsTotal(vo);
	}

	// 캘린더
	@Override
	public List<Map<String, Object>> getSearchCalendar(PayAndDeliveryVO vo) {
		return payAndDeliveryMapper.getSearchCalendar(vo);
	}

}
