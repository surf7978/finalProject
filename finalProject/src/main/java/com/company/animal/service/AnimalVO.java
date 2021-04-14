package com.company.animal.service;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AnimalVO {
	String animalNumber;
	String name;
	String gender;
	String kind;
	String birth;
	String memberId;
	String image;
	MultipartFile uploadFile;
}
