package com.company.hotel.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class HotelVO {
	String seq;
	String name;
	String optionName;
	String price;
	String location;
	String businessNumber;
	// upload
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;

}