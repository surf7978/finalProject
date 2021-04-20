package com.company.buy.service;

import lombok.Data;

@Data
public class BuyVO {
	String buyNumber;
	String category;
	String optionName;
	String count;
	String price;
	String buyState;
	String productNumber;
	String pndNumber;
	
	//DB컬럼 수정
	String fromPerson;
	String toPerson;
	String post;
	String address;
	String address2;
	String phone;
	
	//db추가 
	String[] countList;
	String[] optionNameList; 
}
