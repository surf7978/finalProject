
package com.company.bCart.service;

import lombok.Data;

@Data
public class BCartVO {
	String cartNumber;// 장바구니 번호
	String image1;// 이미지
	String name;// 상품명
	String optionName;// 옵션명
	String price;// 옵션금액
	String count;// 수량
	String bisNumber;// 제품번호
	String memberId;// 아이디(주문자)
	String cartCourier; // 택배비
	// DDL
	String cartNumbers[];// 장바구니 번호
}
