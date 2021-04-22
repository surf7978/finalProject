package com.company.payAndDelivery.service;

import java.util.List;

import com.company.buy.service.BuyVO;

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

	// 캘린더용
	String startDate;
	String endDate;
	
	//paging과 관련된 값만 더 추가
	Integer page = 1;
	//null 체크하려면integer이 편함
	int start = 1;
	int end = 10;
	
	List<BuyVO> buyList;
	
}
