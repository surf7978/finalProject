package com.company.payAndDelivery.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.payAndDelivery.service.PayAndDeliveryService;
import com.company.payAndDelivery.service.PayAndDeliveryVO;

@Service
public class PayAndDeliveryServiceimpl implements PayAndDeliveryService{

	@Autowired PayAndDeliveryMapper payAndDeliveryMapper;
	
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

}
