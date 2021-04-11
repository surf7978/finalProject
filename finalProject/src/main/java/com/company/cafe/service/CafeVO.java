package com.company.cafe.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CafeVO {
	String seq;
	String name;
	String optionName;
	String price;
	String location;
	String businessNumber;
	String image1;
	String image2;
	// upload
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;
	//
	String menu;
}
