package com.company.taxi.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TaxiVO {
	String taxiNumber;
	String name;
	String optionName;
	String price;
	String location;
	String businessNumber;
	// upload
	MultipartFile uploadFile;
	MultipartFile t_uploadFile;

}
