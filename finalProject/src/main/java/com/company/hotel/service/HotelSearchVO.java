package com.company.hotel.service;

import lombok.Data;

@Data
public class HotelSearchVO extends HotelVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}
