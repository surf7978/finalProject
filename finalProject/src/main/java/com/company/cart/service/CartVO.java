package com.company.cart.service;

import lombok.Data;

@Data
public class CartVO {
	String cartNumber;
	String image;
	String productName;
	String optionName;
	String optionPrice;
	String count;
	String cartCourier;
	String memberId;
	String productNumber;


}
