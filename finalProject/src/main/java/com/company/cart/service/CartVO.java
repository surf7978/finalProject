package com.company.cart.service;

import lombok.Data;

@Data
public class CartVO {
	String cartNumber; // 장바구니 번호
	String image; // 이미지
	String productName; // 상품명
	String optionName; // 옵션명
	String optionPrice; // 옵션금액
	String count; // 수량
	String cartCourier; // 택배비
	String memberId; // 아이디(주문자)
	String productNumber;// 제품번호
	// DDL
	String cartNumbers[];// 장바구니 번호
	// 쇼핑몰장바구니
	String[] countList;
	String[] optionNameList;
	String[] optionPriceList;
}
