package com.company.payAndDelivery.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;

@Service
public class PayAndDeliveryServiceimpl implements PayAndDeliveryService{
	
	@Autowired PayAndDeliveryMapper PayAndDeliveryMapper;
	//등록
	@Override
	public int insertPayAndDelivery(PayAndDeliveryVO vo) {
		return PayAndDeliveryMapper.insertPayAndDelivery(vo);
	}
	//단건조회
	@Override
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo) {
		return PayAndDeliveryMapper.getPayAndDelivery(vo);
	}
	//전체조회
	@Override
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo) {
		return PayAndDeliveryMapper.getSearchPayAndDelivery(vo);
	}
	//수정
	@Override
	public int updatePayAndDelivery(PayAndDeliveryVO vo) {
		return PayAndDeliveryMapper.updatePayAndDelivery(vo);
	}
	
	//탈퇴
	@Override
	public int deletePayAndDelivery(PayAndDeliveryVO vo) {
		return PayAndDeliveryMapper.deletePayAndDelivery(vo);
	}


}
