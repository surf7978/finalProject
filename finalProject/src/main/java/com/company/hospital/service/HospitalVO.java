package com.company.hospital.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class HospitalVO {
	String seq;
	String category1;
	String name;
	String optionName;
	String price;
	String location;
	String businessNumber;
	String t_image;
	String image;
	String category2;
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;
}
