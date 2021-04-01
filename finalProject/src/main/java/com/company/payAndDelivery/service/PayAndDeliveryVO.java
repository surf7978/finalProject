package com.company.payAndDelivery.service;

import lombok.Data;

@Data
public class PayAndDeliveryVO {
	String pndNumber;
	String category;
	String courierCompany;
	String payDate;
	String invoiceNumber;
	String sumPrice;
	String memberId;
	
	//DB컬럼 수정
	String buyState;

}
