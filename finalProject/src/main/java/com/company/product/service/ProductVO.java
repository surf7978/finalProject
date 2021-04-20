package com.company.product.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	String productNumber;
	String category;
	String category2;
	String image;
	String productName;
	String optionName;
	String optionPrice;
	String productState;
	String memberId;
	String t_image;
	MultipartFile[] uploadFile;
	MultipartFile t_uploadFile;
	//결제관련
	String resultPrice;
	String count;
	String[] countList;
	String[] optionNameList;
	String[] optionPriceList;
	
}
