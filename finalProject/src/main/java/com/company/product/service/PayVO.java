package com.company.product.service;

import lombok.Data;

@Data
public class PayVO {
	//결제관련
	String resultPrice;
	String count;
	String name;
	String phone;
	String post;
	String address;
	String address2;
	//제품관련
	String bizNumber;
	String optionName;
	String businessNumber;	
}
