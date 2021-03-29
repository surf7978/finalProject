package com.company.hotel.service;

import lombok.Data;

@Data
public class HotelVO {
	private String hotelNumber; // 호텔상품번호
	private String name; // 호텔상품명
	private String optionName; // 호텔옵션명
	private String price; // 호텔옵션가격
	private String location; // 지역
	private String businessNumber;// 사업자번호
}
