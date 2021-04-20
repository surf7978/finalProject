package com.company.payAndDelivery.service;

import lombok.Data;

@Data
public class PayAndDeliveryVO {
	String pndNumber;
	String category;
	String courierCompany; // 택배회사 코드
	String payDate;
	String invoiceNumber; // 송장번호
	String sumPrice;
	String memberId;

	// DB컬럼 수정
	String buyState;
	String businessNumber;// 사업자 번호
	String search;
}
