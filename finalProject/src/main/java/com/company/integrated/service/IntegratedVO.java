package com.company.integrated.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class IntegratedVO {
	String code; // businessTable에서 가져올 사업자 코드값
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
}
