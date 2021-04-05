package com.company.cafe.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CafeVO {
	String cafeNumber;
	String name;
	String optionName;
	String price;
	String location;
	String businessNumber;
	String tImage;
	String image;
	// upload
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;

}
