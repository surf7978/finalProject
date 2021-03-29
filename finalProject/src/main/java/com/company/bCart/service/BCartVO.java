package com.company.bCart.service;

import lombok.Data;

@Data
public class BCartVO {
	private String bcartNumber;// 사업자 장바구니 번호
	private String image; // 이미지
	private String name;// 상품명
	private String optionName;// 옵션
	private String price;// 가격
	private String count;// 수량
	private String bIsNumber;// 사업자상품번호
	private String memberId;// 아이디

}
