package com.company.payAndDelivery.service.impl;

import java.util.List;

import com.company.payAndDelivery.service.PayAndDeliveryVO;

public interface PayAndDeliveryMapper {
	public int insertMember(PayAndDeliveryVO vo);
	public PayAndDeliveryVO getMember(PayAndDeliveryVO vo);
	public List<PayAndDeliveryVO> getSearchMember(PayAndDeliveryVO vo);
	public int updateMember(PayAndDeliveryVO vo);
	public int deleteMember(PayAndDeliveryVO vo);
}
