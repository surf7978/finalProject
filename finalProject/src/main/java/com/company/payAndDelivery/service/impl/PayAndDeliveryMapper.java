package com.company.payAndDelivery.service.impl;

import java.util.List;

import com.company.payAndDelivery.service.PayAndDeliveryVO;

public interface PayAndDeliveryMapper {
	public int insertPayAndDelivery(PayAndDeliveryVO vo);
	public PayAndDeliveryVO getPayAndDelivery(PayAndDeliveryVO vo);
	public List<PayAndDeliveryVO> getSearchPayAndDelivery(PayAndDeliveryVO vo);
	public int updatePayAndDelivery(PayAndDeliveryVO vo);
	public int deletePayAndDelivery(PayAndDeliveryVO vo);
}
