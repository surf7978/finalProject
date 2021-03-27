package com.company.payAndDelivery.service;

import lombok.Data;

@Data
public class PayAndDeliveryVO {
	String pndNumber;
	String category;
	String fromPerson;
	String toPerson;
	String post;
	String address;
	String address2;
	String phone;
	String courierCompany;
	String payDate;
	String invoiceNumber;
	String sumPrice;
	String memberId;

}
